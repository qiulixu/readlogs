/**********************************************
** @Des: This file ...
** @Author: Fuzz
** @Date:   2019-05-23 20:52:57
** @Last Modified by:   Fuzz
** @Last Modified time: 2019-05-23 20:53:02
***********************************************/
package models

import (
	"github.com/astaxie/beego/orm"
)

type Host struct {
	Id         int
	Name 	   string
	Host   	   string
	Account    string
	Password   string
	Status     int
	CreateTime int64
	UpdateTime int64
}

func (a *Host) TableName() string {
	return TableName("uc_host")
}

func HostAdd(a *Host) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func HostGetByName(loginName string) (*Host, error) {
	a := new(Host)
	err := orm.NewOrm().QueryTable(TableName("uc_host")).Filter("name", loginName).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func HostGetList(page, pageSize int, filters ...interface{}) ([]*Host, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Host, 0)
	query := orm.NewOrm().QueryTable(TableName("uc_host"))
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("-id").Limit(pageSize, offset).All(&list)
	return list, total
}

func HostGetById(id int) (*Host, error) {
	r := new(Host)
	err := orm.NewOrm().QueryTable(TableName("uc_host")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Host) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
