Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k6xT077jzDqJT
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 00:21:32 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3GEK3rV110759
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 10:21:31 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rwfpuu9he-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 10:21:30 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Tue, 16 Apr 2019 15:21:30 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Apr 2019 15:21:27 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3GELR4S35717218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Apr 2019 14:21:27 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2921AE05C;
 Tue, 16 Apr 2019 14:21:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDFD4AE05F;
 Tue, 16 Apr 2019 14:21:26 +0000 (GMT)
Received: from [9.10.99.66] (unknown [9.10.99.66])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Apr 2019 14:21:26 +0000 (GMT)
Subject: Re: phosphor-fan-presence-tach failed with DBusMethodError
To: Brad Chou <chou.brad@gmail.com>, openbmc@lists.ozlabs.org
References: <79ECCA67-5A36-48A7-B5DF-5840DC390D8C@gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Tue, 16 Apr 2019 09:21:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <79ECCA67-5A36-48A7-B5DF-5840DC390D8C@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19041614-0040-0000-0000-000004E1B7CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010937; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01189925; UDB=6.00623500; IPR=6.00970719; 
 MB=3.00026467; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-16 14:21:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041614-0041-0000-0000-000008ECC22E
Message-Id: <c7688048-6b3e-3b18-9b4d-919479bce043@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160096
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 14:21:33 -0000



On 4/16/19 4:53 AM, Brad Chou wrote:
> Hi All,
> The phosphor-fan-presence-tach failed as :
> root@mingder:~# systemctl status phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service> --no-pager
> ? phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service> - Phosphor Fan Presence 
> Tach Daemon
>     Loaded: loaded 
> (/lib/systemd/system/obmc-chassis-poweron@0.target.requires 
> <mailto:lib/systemd/system/obmc-chassis-poweron@0.target.requires>/../phosphor-fan-presence-tach@.service; 
> static; vendor preset: enabled)
>     Active: failed (Result: signal) since Tue 2019-04-16 15:34:06 UTC; 
> 1min 21s ago
>    Process: 2183 ExecStart=/usr/bin/env phosphor-fan-presence-tach 
> (code=killed, signal=ABRT)
>   Main PID: 2183 (code=killed, signal=ABRT)
> 
> Apr 16 15:34:05 mingder systemd[1]: phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service>: Service RestartSec=1s 
> expired, scheduling restart.
> Apr 16 15:34:05 mingder systemd[1]: phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service>: Scheduled restart job, 
> restart counter is at 2.
> Apr 16 15:34:06 mingder systemd[1]: Stopped Phosphor Fan Presence Tach 
> Daemon.
> Apr 16 15:34:06 mingder systemd[1]: phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service>: Start request repeated 
> too quickly.
> Apr 16 15:34:06 mingder systemd[1]: phosphor-fan-presence-tach@0.service 
> <mailto:phosphor-fan-presence-tach@0.service>: Failed with result 'signal'.
> Apr 16 15:34:06 mingder systemd[1]: Failed to start Phosphor Fan 
> Presence Tach Daemon.
> root@mingder:~#
> 
> 
> After trying to execute it manually, I got this error:
> root@mingder:~# /usr/bin/env phosphor-fan-presence-tach
> terminate called after throwing an instance of 
> 'phosphor::fan::util::DBusMethodError'
>    what():  DBus method call failed
> Aborted
> root@mingder:~#
Could you provide the journal pretty output after running it manually 
for the entries in regard to phosphor-fan-presence-tach?
	`journalctl -o json-pretty`
This may help show what object is failing the method call to dbus.
> 
> 
> My config.yaml for phosphor-fan-presence-config-native/ is :
> - name: fan1
>    path: /system/chassis/motherboard/fan1
>    methods:
>      - type: tach
>        sensors:
>          - FAN1_L
> 
> - name: fan2
>    path: /system/chassis/motherboard/fan2
>    methods:
>      - type: tach
>        sensors:
>          - FAN2_L
> 
> - name: fan3
>    path: /system/chassis/motherboard/fan3
>    methods:
>      - type: tach
>        sensors:
>          - FAN3_L
> 
> - name: fan4
>    path: /system/chassis/motherboard/fan4
>    methods:
>      - type: tach
>        sensors:
>          - FAN4_L
> 
> 
> The /system/chassis/motherboard/fanX can be seen as :
> [bradchou@localhost ~]$ curl -b cjar -k 
> https://${bmc}/xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
>        "Functional": true,
>        "Present": true,
>        "PrettyName": "fan1"
>      },
>      "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2": {
>        "Functional": true,
>        "Present": true,
>        "PrettyName": "fan2"
>      },
>      "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3": {
>        "Functional": true,
>        "Present": true,
>        "PrettyName": "fan3"
>      },
>      "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan4": {
>        "Functional": true,
>        "Present": true,
>        "PrettyName": "fan4"
>      },
> 
> 
> I can also get the sensors for each FAN:
> [bradchou@localhost ~]$ curl -b cjar -k 
> https://${bmc}/xyz/openbmc_project/sensors/fan_tach/enumerate
> "data": {
>      "/xyz/openbmc_project/sensors/fan_tach/FAN1_L": {
>        "CriticalAlarmHigh": false,
>        "CriticalAlarmLow": false,
>        "CriticalHigh": 20000,
>        "CriticalLow": 1200,
>        "MaxValue": 0,
>        "MinValue": 0,
>        "Scale": 0,
>        "Target": 128,
>        "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>        "Value": 10485
>      },
> 
> It seems the sensor is ok and the inventory object for fan is also created.
> But the phosphor-fan-presence-tach still failed.
> Can anyone help me to figurate out what’s going wrong ?
> 
> Thanks.
> 
> 
