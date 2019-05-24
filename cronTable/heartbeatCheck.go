// @Title 
// @Description 
// @Author  Fuzz (2019-05-24:19:03)
// @Update  Fuzz (2019-05-24:19:03)
package cronTable

import (
	"readlogs/fun"
	"time"
)

func init(){
	//每5分钟进行一次主机存活检测
	ticker := time.NewTicker(time.Hour)
	go func() {
		for  _ = range ticker.C {
			//进行连接数据库中的ssh
			fun.HeartbeatCheck()
		}
	}()
	// Ticker和Timer一样可以被停止。一旦Ticker停止后，通道将不再
	// 接收数据，这里我们将在1500毫秒之后停止
}