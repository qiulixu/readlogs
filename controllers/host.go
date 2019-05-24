/**********************************************
** @Des: 主机列表
** @Author: Fuzz
** @Date:   2017-09-08 17:48:30
** @Last Modified by:   Fuzz
** @Last Modified time: 2019-05-23 20:30:14
***********************************************/
package controllers

import (
	"fmt"
	"strings"
	"time"

	"github.com/astaxie/beego"
	"readlogs/models"
)

type HostController struct {
	BaseController
}

func (self *HostController) List() {
	self.Data["pageTitle"] = "主机列表"
	self.display()
}

func (self *HostController) Add() {
	self.Data["pageTitle"] = "新增主机"
	self.display()
}

func (self *HostController) Edit() {
	self.Data["pageTitle"] = "编辑主机"

	id, _ := self.GetInt("id", 0)
	host, _ := models.HostGetById(id)
	row := make(map[string]interface{})
	row["id"] = host.Id
	row["name"] = host.Name
	row["host"] = host.Host
	row["account"] = host.Account
	row["password"] = host.Password
	self.Data["host"] = row
	self.display()
}

func (self *HostController) AjaxSave() {
	//获取用户id
	Host_id, _ := self.GetInt("id")
	if Host_id == 0 {
		Host := new(models.Host)
		Host.Name = strings.TrimSpace(self.GetString("name"))
		Host.Host = strings.TrimSpace(self.GetString("host"))
		Host.Account = strings.TrimSpace(self.GetString("account"))
		Host.Password = strings.TrimSpace(self.GetString("password"))
		Host.UpdateTime = time.Now().Unix()
		Host.CreateTime = time.Now().Unix()
		Host.CreateId = self.userId
		Host.Status = 1

		// 检测主机是否已存在
		_, err := models.HostGetByName(Host.Host)

		if err == nil {
			self.ajaxMsg("主机已经存在", MSG_ERR)
		}
		//新增

		Host.UpdateId = self.userId
		if _, err := models.HostAdd(Host); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	Host, _ := models.HostGetById(Host_id)
	//修改
	Host.Id = Host_id
	Host.UpdateTime = time.Now().Unix()
	Host.UpdateId = self.userId
	Host.Name = strings.TrimSpace(self.GetString("name"))
	Host.Host = strings.TrimSpace(self.GetString("host"))
	Host.Account = strings.TrimSpace(self.GetString("account"))
	if strings.TrimSpace(self.GetString("password")) != ""{
		Host.Password = strings.TrimSpace(self.GetString("password"))
	}
	Host.UpdateTime = time.Now().Unix()
	Host.UpdateId = self.userId
	Host.Status = 1
	if err := Host.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg(0, MSG_OK)
}

func (self *HostController) AjaxDel() {

	hostId, _ := self.GetInt("id")
	status := strings.TrimSpace(self.GetString("status"))

	hostStatus := 0
	if status == "enable" {
		hostStatus = 1
	}

	host, _ := models.HostGetById(hostId)
	host.UpdateTime = time.Now().Unix()
	host.Status = hostStatus
	host.Id = hostId
	if err := host.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("操作成功", MSG_OK)
}

func (self *HostController) Table() {
	//列表
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	limit, err := self.GetInt("limit")
	if err != nil {
		limit = 30
	}

	realName := strings.TrimSpace(self.GetString("realName"))

	StatusText := make(map[int]string)
	StatusText[0] = "<font color='red'>禁用</font>"
	StatusText[1] = "正常"

	self.pageSize = limit
	//查询条件
	filters := make([]interface{}, 0)
	//
	if realName != "" {
		//查询主机
		filters = append(filters, "host", realName)
	}
	result, count := models.HostGetList(page, self.pageSize, filters...)
	fmt.Println(result)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["name"] = v.Name
		row["host"] = v.Host
		row["account"] = v.Account
		row["password"] = "********"
		row["create_time"] = beego.Date(time.Unix(v.CreateTime, 0), "Y-m-d H:i:s")
		row["update_time"] = beego.Date(time.Unix(v.UpdateTime, 0), "Y-m-d H:i:s")
		row["status"] = v.Status
		row["status_text"] = StatusText[v.Status]
		list[k] = row
	}
	self.ajaxList("成功", MSG_OK, count, list)
}
