// @Title  公共方法
// @Description 公共方法
// @Author  Fuzz (2019-05-24:19:08)
// @Update  Fuzz (2019-05-24:19:08)
package fun

import (
	"github.com/pkg/sftp"
	"golang.org/x/crypto/ssh"
	"net"
	"readlogs/models"
	"time"
)

// @title  连接心跳检测
// @description  连接心跳检测
// @auth  2019/5/24:10:02   Fuzz
// @param   packageAll    *PackageDataTmp   "所有的数据包"
// @return  err           error             "错误信息"
func HeartbeatCheck()(session *sftp.Client,err error){
	//获取开启的主机进行扫描
	hostList,err := models.HostGetListAll("status",1)
	if err != nil{
		return
	}
	for _,v := range hostList {
		session, err = ConnSftp(v.Account,v.Password,v.Host)
		//连接成功 1 连接失败 0
		v.ConnStatus = 1
		if err != nil{
			v.ConnStatus = 0
		}
		if err = v.Update();err != nil{
			continue
		}
	}
	return
}

// @title  连接ssh
// @description  连接ssh,20秒超时
// @auth  2019/5/24:10:02   Fuzz
// @param   packageAll    *PackageDataTmp   "所有的数据包"
// @return  err           error             "错误信息"
func ConnSftp(user, password, host string) (*sftp.Client, error) {
	var (
		auth         []ssh.AuthMethod
		clientConfig *ssh.ClientConfig
		sshClient    *ssh.Client
		sftpClient   *sftp.Client
		err          error
	)
	//获取密码加密
	auth = make([]ssh.AuthMethod, 0)
	auth = append(auth, ssh.Password(password))

	clientConfig = &ssh.ClientConfig{
		User:    user,
		Auth:    auth,
		Timeout: 5 * time.Second,
		//需要验证服务端，不做验证返回nil就可以，点击HostKeyCallback看源码就知道了
		HostKeyCallback: func(hostname string, remote net.Addr, key ssh.PublicKey) error {
			return nil
		},
	}

	if sshClient, err = ssh.Dial("tcp", host, clientConfig); err != nil {
		return nil, err
	}

	if sftpClient, err = sftp.NewClient(sshClient); err != nil {
		return nil, err
	}

	return sftpClient, nil
}