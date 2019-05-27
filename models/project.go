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

type Project struct {
	Id         int
	Name 	   string
	Status     int
	UpdateId   int
	CreateId   int
	CreateTime int64
	UpdateTime int64
}
func (a *Project) TableName() string {
	return TableName("uc_project")
}

func ProjectAdd(a *Project) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func ProjectGetByName(loginName string) (*Project, error) {
	a := new(Project)
	err := orm.NewOrm().QueryTable(TableName("uc_project")).Filter("name", loginName).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func ProjectGetList(page, pageSize int, filters ...interface{}) ([]*Project, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Project, 0)
	query := orm.NewOrm().QueryTable(TableName("uc_project"))
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

func ProjectGetListAll(filters ...interface{}) ([]*Host,error) {
	list := make([]*Host, 0)
	query := orm.NewOrm().QueryTable(TableName("uc_project"))
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	_, err := query.OrderBy("-id").All(&list)
	return list, err
}

func ProjectGetById(id int) (*Project, error) {
	r := new(Project)
	err := orm.NewOrm().QueryTable(TableName("uc_project")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Project) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
