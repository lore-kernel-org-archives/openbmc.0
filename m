Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q7c65vsjzDqWG
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 04:08:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3OHrnUY121269
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 14:08:51 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s2v4w9usu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 14:08:51 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Wed, 24 Apr 2019 19:08:50 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Apr 2019 19:08:49 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3OI8mrx24510618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Apr 2019 18:08:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CE6A7805E;
 Wed, 24 Apr 2019 18:08:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFEC57806B;
 Wed, 24 Apr 2019 18:08:47 +0000 (GMT)
Received: from [9.10.99.66] (unknown [9.10.99.66])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Apr 2019 18:08:47 +0000 (GMT)
Subject: Re: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
To: Patrick Venture <venture@google.com>, Stephen Boylan <sboylan@ircona.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
 <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Wed, 24 Apr 2019 13:08:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19042418-8235-0000-0000-00000E8669A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010988; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01193804; UDB=6.00625847; IPR=6.00974627; 
 MB=3.00026579; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-24 18:08:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042418-8236-0000-0000-00004546C927
Message-Id: <8edee610-90b5-5a77-6732-356a2719eba6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-24_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904240131
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
X-List-Received-Date: Wed, 24 Apr 2019 18:08:55 -0000



On 4/24/19 11:38 AM, Patrick Venture wrote:
> On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan <sboylan@ircona.com> wrote:
>>
>> Hello all,
>>
>> I’ve run into an issue with my fan control. I have a simple two fan system which is failing to start phosphor-fan-control@.service
>>
>>
>>
>> This is the status
>>
>> root@evb-ast2500:/lib/systemd/system# systemctl status phosphor-fan-control@0.service --no-page
>>
>> ? phosphor-fan-control@0.service - Phosphor Fan Control Daemon
>>
>>     Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service; static; vendor preset: enabled)
>>
>>     Active: failed (Result: exit-code) since Wed 2019-04-24 16:22:36 UTC; 16s ago
>>
>>    Process: 1218 ExecStart=/usr/bin/env phosphor-fan-control --control (code=exited, status=1/FAILURE)
>>
>> Main PID: 1218 (code=exited, status=1/FAILURE)
>>
>>
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Service RestartSec=1s expired, scheduling restart.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Scheduled restart job, restart counter is at 2.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan Control Daemon.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Start request repeated too quickly.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Failed with result 'exit-code'.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor Fan Control Daemon.
>>
>>
>>
>> And I noticed this in the journalctl
>>
>> {
>>
>>          "__CURSOR" : "s=efc0b033c5f243798b56446bcaffc0f5;i=23d;b=2de3ccbcea7940f5b51652e55e900cd2;m=2f22198c;t=5874871dec1c2;x=f1ba902c2ec1feae",
>>
>>          "__REALTIME_TIMESTAMP" : "1556120101372354",
>>
>>          "__MONOTONIC_TIMESTAMP" : "790763916",
>>
>>          "_BOOT_ID" : "2de3ccbcea7940f5b51652e55e900cd2",
>>
>>          "_UID" : "0",
>>
>>          "_GID" : "0",
>>
>>          "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eaeeb55a49",
>>
>>          "_HOSTNAME" : "evb-ast2500",
>>
>>          "_TRANSPORT" : "journal",
>>
>>          "_CAP_EFFECTIVE" : "3fffffffff",
>>
>>          "CODE_FILE" : "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysroot/usr
>>
>> /include/phosphor-logging/log.hpp",
>>
>>          "CODE_LINE" : "105",
>>
>>          "CODE_FUNC" : "helper_log",
>>
>>          "PRIORITY" : "3",
>>
>>          "MESSAGE" : "Uncaught DBus service lookup failure exception",
>>
>>          "TRANSACTION_ID" : "114915536",
>>
>>          "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan0",
>>
>>          "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
>>
>>          "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
>>
>>          "_PID" : "1273",
>>
>>          "_COMM" : "phosphor-fan-co",
>>
>>          "_EXE" : "/usr/sbin/phosphor-fan-control",
>>
>>          "_CMDLINE" : "phosphor-fan-control --control",
>>
>>          "_SYSTEMD_CGROUP" : "/system.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-control@0.service",
>>
>>          "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
>>
>>          "_SYSTEMD_SLICE" : "system-phosphor\\x2dfan\\x2dcontrol.slice",
>>
>>          "_SYSTEMD_INVOCATION_ID" : "21572a9f879c44cab2b9b6b4c5e9a504",
>>
>>          "_SOURCE_REALTIME_TIMESTAMP" : "1556120101372269"
>>
>> }
>>
>>
>>
>> I know the PATH exists, though I’m not entirely sure about the INTERFACE. I’ve checked systemctl to see if I can find it and I don’t see it. Should I be checking elsewhere for it?
>>
>>
>>
>>
>>
>> I can see my fan_tach sensors and my chassis entries as such
>>
>> /xyz/openbmc_project/sensors/fan_tach/enumerate
>>
>> {
>>
>>      "data": {
>>
>>          "/xyz/openbmc_project/sensors/fan_tach/fan0": {
>>
>>              "CriticalAlarmHigh": false,
>>
>>              "CriticalAlarmLow": false,
>>
>>              "CriticalHigh": 5500,
>>
>>              "CriticalLow": 1000,
>>
>>              "MaxValue": 0,
>>
>>              "MinValue": 0,
>>
>>              "Scale": 0,
>>
>>              "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>
>>              "Value": 4292,
>>
>>              "WarningAlarmHigh": false,
>>
>>              "WarningAlarmLow": false,
>>
>>              "WarningHigh": 5000,
>>
>>              "WarningLow": 1500
>>
>>          },
>>
>>          "/xyz/openbmc_project/sensors/fan_tach/fan1": {
>>
>>              "CriticalAlarmHigh": false,
>>
>>              "CriticalAlarmLow": false,
>>
>>              "CriticalHigh": 5500,
>>
>>              "CriticalLow": 1000,
>>
>>              "MaxValue": 0,
>>
>>              "MinValue": 0,
>>
>>              "Scale": 0,
>>
>>              "Target": 255,
>>
>>              "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>
>>              "Value": 3551,
>>
>>              "WarningAlarmHigh": false,
>>
>>              "WarningAlarmLow": false,
>>
>>              "WarningHigh": 5000,
>>
>>              "WarningLow": 1500
>>
>>          }
>>
>>      },
>>
>>      "message": "200 OK",
>>
>>      "status": "ok"
>>
>> }
>>
>>
>>
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
>>
>> {
>>
>>      "data": {
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0": {
>>
>>              "Functional": true,
>>
>>              "Present": true,
>>
>>             "PrettyName": "fan0"
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/fan0": {
>>
>>              "Functional": true
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
>>
>>              "Functional": true,
>>
>>              "Present": true,
>>
>>              "PrettyName": "fan1"
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1/fan1": {
>>
>>              "Functional": true
>>
>>          }
>>
>>      },
>>
>>      "message": "200 OK",
>>
>>      "status": "ok"
>>
>> }
> 
> It looks like they don't have that PWM interface.  You can check if
> the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
> that has your fans.

Also, what target mode do you have configured for the hwmon instance? 
The *.Control.FanPWM interface is created for the fan objects by the 
hwmon instance, when `TARGET_MODE = "PWM"` in the config.

> 
>>
>>
> 
