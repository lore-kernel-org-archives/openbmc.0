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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qnng5r4nzDqc2
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 05:49:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3PJj50W120975
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 15:49:24 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s3hf9my56-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 15:49:23 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Thu, 25 Apr 2019 20:49:23 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Apr 2019 20:49:21 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3PJnKNV6095200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 19:49:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8657FBE053;
 Thu, 25 Apr 2019 19:49:20 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DB1DBE04F;
 Thu, 25 Apr 2019 19:49:20 +0000 (GMT)
Received: from [9.10.99.66] (unknown [9.10.99.66])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Apr 2019 19:49:20 +0000 (GMT)
Subject: Re: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
To: Stephen Boylan <sboylan@ircona.com>, Patrick Venture <venture@google.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
 <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>
 <8edee610-90b5-5a77-6732-356a2719eba6@linux.ibm.com>
 <AM0PR04MB521859872EEEFC9332114A6CC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
 <269e980d-875c-7e91-3fae-6a5adb7e2a4a@linux.ibm.com>
 <AM0PR04MB5218C2DCDA42D3A688FB200EC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Thu, 25 Apr 2019 14:49:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB5218C2DCDA42D3A688FB200EC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19042519-8235-0000-0000-00000E872B24
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010994; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194311; UDB=6.00626155; IPR=6.00975139; 
 MB=3.00026597; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-25 19:49:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042519-8236-0000-0000-0000454B1E0F
Message-Id: <2236078a-d199-caf3-4f16-400cc65a7d91@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-25_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904250121
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
X-List-Received-Date: Thu, 25 Apr 2019 19:49:28 -0000



On 4/25/19 10:42 AM, Stephen Boylan wrote:
> Here's my fans.yaml, which doesn't contain any reference to a fan2
> 
> fans:
>    - inventory: /system/chassis/motherboard/fan0
>      cooling_zone: 0
>      sensors:
>        - fan0
>      target_interface: xyz.openbmc_project.Control.FanPwm
>    - inventory: /system/chassis/motherboard/fan1
>      cooling_zone: 0
>      sensors:
>        - fan1
>      target_interface: xyz.openbmc_project.Control.FanPwm
> 
> I've pushed my changes into the following repo as requested
> https://github.com/JesusPhish/openbmc/tree/master/meta-evb/meta-evb-aspeed/meta-evb-ast2500/recipes-phosphor/fans?fbclid=IwAR3VgrLDBqzncNMhfuLZMAnZS4xopyfxTLfIC3IJHYxLKKxX3eqAL4x0oCE

I pulled down your repo, built phosphor-fan, and none of the generated 
code has a reference to fan2 other than the example yamls. Could you 
check that the generated code for fan control does not contain a 
reference to fan2? Its located within your bitbake build directory under 
`tmp/work/armv6-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+71779ab4b3-r1/git/control/`. 
The "fan_zone_defs.cpp" contains what is generated from your configs.

If this doesnt contain any reference to fan2, then it would seem the 
built phosphor-fan-control application on your BMC was built with a 
reference to fan2. Maybe do a `cleanall` on your image, rebuild, check 
the generated code, and reinstall on your BMC?
> 
> -----Original Message-----
> From: Matthew Barth <msbarth@linux.ibm.com>
> Sent: 25 April 2019 15:49
> To: Stephen Boylan <sboylan@ircona.com>; Patrick Venture <venture@google.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Fan control service issues - service will not start "Uncaught DBus service lookup failure exception"
> 
> 
> 
> On 4/25/19 4:56 AM, Stephen Boylan wrote:
>> After looking at my configuration file for
>> /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/ I noticed I had in an
>> error to try fix an issue I set PWM_TARGET_fan1 = "0". Since I changed
>> this back to what is below, now I get the following error when trying
>> to start fan control services, similar to the original one but for a
>> different fan.
>>
>> {
>>
>>           "__CURSOR" :
>> "s=fdd5653de8ca4f298bf0d04f018a68d7;i=219;b=445f19f9668b4129b216ec827e
>> d31ddb;m=ad54afd;t=58757bd23b204;x=757e520ccf3b4259",
>>
>>           "__REALTIME_TIMESTAMP" : "1556185788690948",
>>
>>           "__MONOTONIC_TIMESTAMP" : "181750525",
>>
>>           "_BOOT_ID" : "445f19f9668b4129b216ec827ed31ddb",
>>
>>           "_UID" : "0",
>>
>>           "_GID" : "0",
>>
>>           "_MACHINE_ID" : "a361a071fa454d939ee5c5a7324cf2de",
>>
>>           "_HOSTNAME" : "evb-ast2500",
>>
>>           "_TRANSPORT" : "journal",
>>
>>           "_CAP_EFFECTIVE" : "3fffffffff",
>>
>>           "CODE_FILE" :
>> "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnu
>> eabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysroot/usr
>>
>> /include/phosphor-logging/log.hpp",
>>
>>           "CODE_LINE" : "105",
>>
>>           "CODE_FUNC" : "helper_log",
>>
>>           "PRIORITY" : "3",
>>
>>           "MESSAGE" : "Uncaught DBus service lookup failure exception",
>>
>>           "TRANSACTION_ID" : "2273921040",
>>
>>           "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan2",
>>
>>           "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
>>
>>           "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
>>
>>           "_PID" : "1198",
>>
>>           "_COMM" : "phosphor-fan-co",
>>
>>           "_EXE" : "/usr/sbin/phosphor-fan-control",
>>
>>           "_CMDLINE" : "phosphor-fan-control --control",
>>
>>           "_SYSTEMD_CGROUP" :
>> "/system.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-
>> control@0.service",
>>
>>           "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
>>
>>           "_SYSTEMD_SLICE" :
>> "system-phosphor\\x2dfan\\x2dcontrol.slice",
>>
>>           "_SYSTEMD_INVOCATION_ID" :
>> "140d38d6360847c389c67d0bfa162589",
>>
>>           "_SOURCE_REALTIME_TIMESTAMP" : "1556185788690865"
>>
>> }
>>
>> What I don't understand here is why it's trying to access fan2 at all?
>> I know that path does not exist and as far as I understand it I
>> haven't tried to set it up through any configuration file.
> 
> What does your `fans.yaml` contain? Is there a "sensors:" entry with "fan2" defined similar to romulus? If this does not contain it, would it be possible to push your openbmc repo to github containing all of your configs?
>>
>>> Also, what target mode do you have configured for the hwmon instance?
>>> The *.Control.FanPWM interface is created for the fan objects by the
>>> hwmon instance, when `TARGET_MODE = "PWM"` in the config.
>>
>> Here is my configuration file for the fans, it's primarily based on
>> the meta-romulus .conf file
>>
>>     1 LABEL_fan1 = "fan0"
>>
>>     2 LABEL_fan2 = "fan1"
>>
>>     3
>>
>>     4 PWM_TARGET_fan1 = "1"
>>
>>     5 PWM_TARGET_fan2 = "2"
>>
>>     6
>>
>>     7 WARNLO_fan1 = 1500
>>
>>     8 WARNHI_fan1 = 5000
>>
>>     9 CRITLO_fan1 = 1000
>>
>>    10 CRITHI_fan1 = 5500
>>
>>    11
>>
>>    12 WARNLO_fan2 = 1500
>>
>>    13 WARNHI_fan2 = 5000
>>
>>    14 CRITLO_fan2 = 1000
>>
>>    15 CRITHI_fan2 = 5500
>>
>> Here is the pwm_tacho section of my dts file
>>
>> 153 &pwm_tacho {
>>
>> 154         status = "okay";
>>
>> 155         pinctrl-names = "default";
>>
>> 156         pinctrl-0 = <&pinctrl_pwm0_default
>>
>> 157         &pinctrl_pwm1_default>;
>>
>> 158
>>
>> 159         fan@0 {
>>
>> 160                 reg = <0x00>;
>>
>> 161                 aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>>
>> 162         };
>>
>> 163
>>
>> 164         fan@1 {
>>
>> 165                 reg = <0x01>;
>>
>> 166                 aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>>
>> 167         };
>>
>> 168 };
>>
>>> It looks like they don't have that PWM interface.  You can check if
>>> the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
>>> that has your fans.
>>
>> Here's the contents of hwmon0. I know I can manually echo values into
>> pwm1 and pwm2 and I can see the effect on the fans as they spin.
>>
>> root@evb-ast2500:/sys/class/hwmon/hwmon0# ls
>>
>> device      fan1_input  fan2_input  name        of_node     pwm1
>>    pwm2        subsystem   uevent
>>
>> My understanding is that through the DTS file I've set up fan0 and fan1.
>> These are represented in sys/class/hwmon/hwmon0 as fan1_input and
>> fan2_input. Though the conf file set up in
>> /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/ I've assigned a "pretty
>> name" of fan0 and fan1 to
>>
>> LABEL_fan1 and LABEL_fan2. Those "pretty name" values are used
>> throughout the various configuration files for monitor/presence and control.
>>
>> ----------------------------------------------------------------------
>> --
>>
>> *From:*Matthew Barth <msbarth@linux.ibm.com>
>> *Sent:* 24 April 2019 18:08
>> *To:* Patrick Venture; Stephen Boylan
>> *Cc:* openbmc@lists.ozlabs.org
>> *Subject:* Re: Fan control service issues - service will not start
>> "Uncaught DBus service lookup failure exception"
>>
>>
>>
>> On 4/24/19 11:38 AM, Patrick Venture wrote:
>>   > On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan <sboylan@ircona.com>
>> wrote:
>>   >>
>>   >> Hello all,
>>   >>
>>   >> I've run into an issue with my fan control. I have a simple two
>> fan system which is failing to start phosphor-fan-control@.service  >>
>>>>   >>  >> This is the status  >>  >>
>> root@evb-ast2500:/lib/systemd/system# systemctl status
>> phosphor-fan-control@0.service --no-page  >>  >> ?
>> phosphor-fan-control@0.service - Phosphor Fan Control Daemon  >>  >>
>> Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service;
>> static; vendor
>> preset: enabled)
>>   >>
>>   >>     Active: failed (Result: exit-code) since Wed 2019-04-24
>> 16:22:36 UTC; 16s ago  >>  >>    Process: 1218 ExecStart=/usr/bin/env
>> phosphor-fan-control --control (code=exited, status=1/FAILURE)  >>  >>
>> Main PID: 1218 (code=exited, status=1/FAILURE)  >>  >>  >>  >> Apr 24
>> 16:22:36 evb-ast2500 systemd[1]:
>> phosphor-fan-control@0.service: Service RestartSec=1s expired,
>> scheduling restart.
>>   >>
>>   >> Apr 24 16:22:36 evb-ast2500 systemd[1]:
>> phosphor-fan-control@0.service: Scheduled restart job, restart counter
>> is at 2.
>>   >>
>>   >> Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan
>> Control Daemon.
>>   >>
>>   >> Apr 24 16:22:36 evb-ast2500 systemd[1]:
>> phosphor-fan-control@0.service: Start request repeated too quickly.
>>   >>
>>   >> Apr 24 16:22:36 evb-ast2500 systemd[1]:
>> phosphor-fan-control@0.service: Failed with result 'exit-code'.
>>   >>
>>   >> Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor
>> Fan Control Daemon.
>>   >>
>>   >>
>>   >>
>>   >> And I noticed this in the journalctl  >>  >> {  >>  >>
>> "__CURSOR" :
>> "s=efc0b033c5f243798b56446bcaffc0f5;i=23d;b=2de3ccbcea7940f5b51652e55e
>> 900cd2;m=2f22198c;t=5874871dec1c2;x=f1ba902c2ec1feae",
>>   >>
>>   >>          "__REALTIME_TIMESTAMP" : "1556120101372354",  >>  >>
>> "__MONOTONIC_TIMESTAMP" : "790763916",  >>  >>          "_BOOT_ID" :
>> "2de3ccbcea7940f5b51652e55e900cd2",
>>   >>
>>   >>          "_UID" : "0",
>>   >>
>>   >>          "_GID" : "0",
>>   >>
>>   >>          "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eaeeb55a49",
>>   >>
>>   >>          "_HOSTNAME" : "evb-ast2500",  >>  >>
>> "_TRANSPORT" : "journal",  >>  >>          "_CAP_EFFECTIVE" :
>> "3fffffffff",  >>  >>          "CODE_FILE" :
>> "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnu
>> eabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysroot/usr
>>   >>
>>   >> /include/phosphor-logging/log.hpp",
>>   >>
>>   >>          "CODE_LINE" : "105",
>>   >>
>>   >>          "CODE_FUNC" : "helper_log",  >>  >>          "PRIORITY" :
>> "3",  >>  >>          "MESSAGE" : "Uncaught DBus service lookup
>> failure exception",  >>  >>          "TRANSACTION_ID" : "114915536",
>>>>   >>          "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan0",
>>   >>
>>   >>          "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
>>   >>
>>   >>          "SYSLOG_IDENTIFIER" : "phosphor-fan-control",  >>  >>
>> "_PID" : "1273",  >>  >>          "_COMM" : "phosphor-fan-co",  >>  >>
>> "_EXE" : "/usr/sbin/phosphor-fan-control",  >>  >>          "_CMDLINE"
>> : "phosphor-fan-control --control",  >>  >>          "_SYSTEMD_CGROUP"
>> :
>> "/system.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-
>> control@0.service",
>>   >>
>>   >>          "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",  >>
>>>>            "_SYSTEMD_SLICE" :
>> "system-phosphor\\x2dfan\\x2dcontrol.slice",
>>   >>
>>   >>          "_SYSTEMD_INVOCATION_ID" :
>> "21572a9f879c44cab2b9b6b4c5e9a504",
>>   >>
>>   >>          "_SOURCE_REALTIME_TIMESTAMP" : "1556120101372269"
>>   >>
>>   >> }
>>   >>
>>   >>
>>   >>
>>   >> I know the PATH exists, though I'm not entirely sure about the
>> INTERFACE. I've checked systemctl to see if I can find it and I don't
>> see it. Should I be checking elsewhere for it?
>>   >>
>>   >>
>>   >>
>>   >>
>>   >>
>>   >> I can see my fan_tach sensors and my chassis entries as such  >>
>>>> /xyz/openbmc_project/sensors/fan_tach/enumerate
>>   >>
>>   >> {
>>   >>
>>   >>      "data": {
>>   >>
>>   >>          "/xyz/openbmc_project/sensors/fan_tach/fan0": {  >>  >>
>> "CriticalAlarmHigh": false,  >>  >>              "CriticalAlarmLow":
>> false,  >>  >>              "CriticalHigh": 5500,  >>  >>
>> "CriticalLow": 1000,  >>  >>              "MaxValue": 0,  >>  >>
>> "MinValue": 0,  >>  >>              "Scale": 0,  >>  >>
>> "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>   >>
>>   >>              "Value": 4292,
>>   >>
>>   >>              "WarningAlarmHigh": false,  >>  >>
>> "WarningAlarmLow": false,  >>  >>              "WarningHigh": 5000,
>>>>   >>              "WarningLow": 1500  >>  >>          },  >>  >>
>> "/xyz/openbmc_project/sensors/fan_tach/fan1": {  >>  >>
>> "CriticalAlarmHigh": false,  >>  >>              "CriticalAlarmLow":
>> false,  >>  >>              "CriticalHigh": 5500,  >>  >>
>> "CriticalLow": 1000,  >>  >>              "MaxValue": 0,  >>  >>
>> "MinValue": 0,  >>  >>              "Scale": 0,  >>  >>
>> "Target": 255,  >>  >>              "Unit":
>> "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>   >>
>>   >>              "Value": 3551,
>>   >>
>>   >>              "WarningAlarmHigh": false,  >>  >>
>> "WarningAlarmLow": false,  >>  >>              "WarningHigh": 5000,
>>>>   >>              "WarningLow": 1500  >>  >>          }  >>  >>
>> },  >>  >>      "message": "200 OK",  >>  >>      "status": "ok"
>>   >>
>>   >> }
>>   >>
>>   >>
>>   >>
>>   >>
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
>>   >>
>>   >> {
>>   >>
>>   >>      "data": {
>>   >>
>>   >>
>> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0": {
>>>>   >>              "Functional": true,  >>  >>
>> "Present": true,  >>  >>             "PrettyName": "fan0"
>>   >>
>>   >>          },
>>   >>
>>   >>
>> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/fan0":
>> {  >>  >>              "Functional": true  >>  >>          },  >>
>>   >>
>> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
>>>>   >>              "Functional": true,  >>  >>
>> "Present": true,  >>  >>              "PrettyName": "fan1"
>>   >>
>>   >>          },
>>   >>
>>   >>
>> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1/fan1":
>> {  >>  >>              "Functional": true  >>  >>          }  >>  >>
>> },  >>  >>      "message": "200 OK",  >>  >>      "status": "ok"
>>   >>
>>   >> }
>>   >
>>   > It looks like they don't have that PWM interface.  You can check if
>>> the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
>>> that has your fans.
>>
>> Also, what target mode do you have configured for the hwmon instance?
>> The *.Control.FanPWM interface is created for the fan objects by the
>> hwmon instance, when `TARGET_MODE = "PWM"` in the config.
>>
>>   >
>>   >>
>>   >>
>>   >
>>
> 
