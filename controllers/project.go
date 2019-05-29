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
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
	"readlogs/models"
)

type ProjectController struct {
	BaseController
}

func (self *ProjectController) List() {
	self.Data["pageTitle"] = "主机列表"
	self.display()
}

func (self *ProjectController) Add() {
	self.Data["pageTitle"] = "新增主机"
	// 主机
	filters := make([]interface{}, 0)
	filters = append(filters, "status", 1)
	result, _ := models.HostGetListAll(filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["name"] = v.Name
		list[k] = row
	}
	self.Data["host"] = list
	self.display()
}

func (self *ProjectController) Edit() {
	self.Data["pageTitle"] = "编辑平台"


	id, _ := self.GetInt("id", 0)
	project, _ := models.ProjectGetById(id)
	row := make(map[string]interface{})
	row["id"] = project.Id
	row["name"] = project.Name
	row["path"] = project.Path
	row["host"] = project.Host
	self.Data["project"] = row
	host := strings.Split(project.Host, ",")

	filters := make([]interface{}, 0)
	filters = append(filters, "status", 1)
	result, _ := models.HostGetList(1, 1000, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["checked"] = 0
		for i := 0; i < len(host); i++ {
			hostId, _ := strconv.Atoi(host[i])
			if hostId == v.Id {
				row["checked"] = 1
			}
		}
		row["id"] = v.Id
		row["name"] = v.Name
		list[k] = row
	}
	self.Data["host"] = list
	self.display()
}


func (self *ProjectController) Detail() {
	self.Data["pageTitle"] = "日志查看"

	self.display()
}


func (self *ProjectController) AjaxSave() {
	//获取项目id
	projectId, _ := self.GetInt("id")
	if projectId == 0 {
		project := new(models.Project)
		project.Name = strings.TrimSpace(self.GetString("name"))
		project.Path = strings.TrimSpace(self.GetString("path"))
		project.Host = strings.TrimSpace(self.GetString("hostId"))
		project.UpdateTime = time.Now().Unix()
		project.UpdateId = self.userId
		project.Status = 1

		// 检测平台名称是否重复
		_, err := models.ProjectGetByName(project.Name)
		if err == nil {
			self.ajaxMsg("平台名称已存在", MSG_ERR)
		}
		//新增
		project.CreateId = self.userId
		if _, err := models.ProjectAdd(project); err != nil {
			fmt.Println(err)
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	project, _ := models.ProjectGetById(projectId)
	//修改
	project.Id = projectId
	project.UpdateTime = time.Now().Unix()
	project.UpdateId = self.userId
	project.Name = strings.TrimSpace(self.GetString("name"))
	project.Host = strings.TrimSpace(self.GetString("hostId"))
	project.UpdateTime = time.Now().Unix()
	project.UpdateId = self.userId
	project.Status = 1
	if err := project.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg(0, MSG_OK)
}

func (self *ProjectController) AjaxDel() {

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

func (self *ProjectController) Table() {
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
		filters = append(filters, "name", realName)
	}
	result, count := models.ProjectGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["name"] = v.Name
		row["create_time"] = beego.Date(time.Unix(v.CreateTime, 0), "Y-m-d H:i:s")
		row["update_time"] = beego.Date(time.Unix(v.UpdateTime, 0), "Y-m-d H:i:s")
		row["status"] = v.Status
		row["status_text"] = StatusText[v.Status]
		list[k] = row
	}
	self.ajaxList("成功", MSG_OK, count, list)
}
