// @Title  公共方法
// @Description 公共方法
// @Author  Fuzz (2019-05-24:19:08)
// @Update  Fuzz (2019-05-24:19:08)
package fun

import (
	"bytes"
	"fmt"
	"github.com/pkg/sftp"
	"golang.org/x/crypto/ssh"
	"net"
	"readlogs/models"
	"strings"
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

// @title  获取文件
// @description 获取服务器数据文件
// @auth  2019/4/8:11:00   Fuzz
// @param   length	string   true    "要生成的字符长度"
// @return  str      string   true    "生成指定长度后的字符串"
func GetFile(project *models.Project,hostId int)(data map[string]string,err error){
	hostList,err := models.HostGetById(hostId)
	if err != nil {
		return
	}
	text,err := HostOpenFile(hostList.Account,hostList.Password,hostList.Host,project.Path)
	if err != nil{
		return
	}
	data = map[string]string{"log":string(text)}
	return
}

// @title  获取目录
// @description 获取目录
// @auth  2019/4/8:11:00   Fuzz
// @param   length	string   true    "获取平台"
// @return  str      string   true    "获取目录中文件"
func GetDir(project *models.Project)(data []map[string]interface{},err error){
	hostList,err := models.HostGetListAll("id__in",strings.Split(project.Host,","))
	if err != nil {
		return
	}
	for _,v := range  hostList{
		dirList,err := HostListDir(v.Account,v.Password,v.Host,project.Path)
		if err != nil{
			fmt.Println(err)
		}
		data = append(data, map[string]interface{}{"name":v.Name,"host":v.Host,"dir_list":dirList,"host_id":v.Id})
	}
	return
}

// @title  获取远程文件
// @description 获取远端服务器文件
// @auth  2019/4/8:11:00   Mick
// @param   user		string   true    "用户账号"
// @param  	password   	string   true    "用户密码"
// @param  	host    	string   true    "主机地址"
// @param  	path    	string   true    "服务路径"
// @return  data	    []byte   true    "路径内容"
// @return  err    		error    true    "错误"
func HostListDir(user, password, host,path string) (dirList []string,err error){
	session, err := ConnSftp(user,password,host)
	if err != nil{
		return
	}
	//获取远端文件
	fileInfo, err := session.ReadDir(path)
	if err != nil {
		return
	}
	for _,v := range fileInfo {
		dirList = append(dirList,v.Name())
	}
	return
}

// @title  获取远程文件
// @description 获取远端服务器文件
// @auth  2019/4/8:11:00   Mick
// @param   user		string   true    "用户账号"
// @param  	password   	string   true    "用户密码"
// @param  	host    	string   true    "主机地址"
// @param  	path    	string   true    "服务路径"
// @return  data	    []byte   true    "文件内容"
// @return  err    		error    true    "错误"
func HostOpenFile(user, password, host,path string) ([]byte,error){
	buf := new(bytes.Buffer)
	session, err := ConnSftp(user,password,host)
	if err != nil{
		return nil,err
	}
	//获取远端文件
	srcFile, err := session.Open(path)
	if err != nil {
		return nil,err
	}
	_,err = buf.ReadFrom(srcFile)
	if err != nil {
		return nil,err
	}
	err = srcFile.Close()
	if err != nil {
		return nil,err
	}
	err = session.Close()
	if err != nil {
		return nil,err
	}
	return buf.Bytes(),err
}