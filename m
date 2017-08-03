Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNDQD1WyHzDrD6
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 12:24:03 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v732NarN006551
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 22:24:01 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3mxwpvrp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 22:24:01 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 22:24:00 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 22:23:58 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v732Nvmo25100384; Thu, 3 Aug 2017 02:23:57 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 450DB2803F;
 Wed,  2 Aug 2017 22:23:51 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.151.122])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id A7E0D2803E;
 Wed,  2 Aug 2017 22:23:50 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 3/5] Documentation: hwmon: Add IBM power
 supply documentation
To: Brandon Wyman <bjwyman@gmail.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-4-git-send-email-eajames@linux.vnet.ibm.com>
 <CAK_vbW1GJAaV9OLWTcyY=2s55zMELs1qZ59PZZc-6H1mcm=gEg@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 2 Aug 2017 21:23:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAK_vbW1GJAaV9OLWTcyY=2s55zMELs1qZ59PZZc-6H1mcm=gEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17080302-0008-0000-0000-00000268BDCB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007474; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896751; UDB=6.00448634; IPR=6.00676938; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016507; XFM=3.00000015;
 UTC=2017-08-03 02:23:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080302-0009-0000-0000-0000363EFCEC
Message-Id: <e6d6cc0f-8337-2228-9c28-da98d424131f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030035
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Aug 2017 02:24:04 -0000



On 08/02/2017 05:11 PM, Brandon Wyman wrote:
> On Wed, Aug 2, 2017 at 3:25 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   Documentation/hwmon/ibmps | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/hwmon/ibmps
>>
>> diff --git a/Documentation/hwmon/ibmps b/Documentation/hwmon/ibmps
>> new file mode 100644
>> index 0000000..7f13fd4
>> --- /dev/null
>> +++ b/Documentation/hwmon/ibmps
>> @@ -0,0 +1,53 @@
>> +Kernel driver ibmps
>> +====================
>> +
>> +Supported chips:
>> +  * IBM Witherspoon power supply
>> +
>> +Author: Eddie James <eajames@us.ibm.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver supports the IBM power supply. This driver is a client to the core
>> +PMBus driver.
>> +
>> +Usage Notes
>> +-----------
>> +
>> +This driver should auto-detect devices. In the event that it does not, you will
>> +have to instantiate the devices explicitly. Please see
>> +Documentation/i2c/instantiating-devices for details.
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +The following attributes are supported:
>> +
>> +curr1_alarm            Output current over-current fault.
>> +curr1_input            Measured output current in mA.
>> +curr1_label            "iout1"
>> +
>> +fan1_alarm             Fan 1 warning.
>> +fan1_fault             Fan 1 fault.
>> +fan1_input             Fan 1 speed in RPM.
>> +fan2_alarm             Fan 2 warning.
>> +fan2_fault             Fan 2 fault.
>> +fan2_input             Fan 2 speed in RPM.
>> +
>> +in1_alarm              Input voltage under-voltage fault.
> Is this the normal/regular file to put this under-voltage fault in? I
> noticed that the UCD9200 device driver appears to be the only one
> looking for that right now, and it has it updating in1_lcrit_alarm:
> ucd9200:in1_lcrit_alarm         Voltage critical low alarm. From
> VIN_UV_FAULT status.

Since this is "vin" this will provide the status of VIN_UV_FAULT. 
Similarly, VOUT_OV_FAULT will be provided by the in2_alarm ("vout"). The 
power supply doesn't provide limit ranges for it's values, so in order 
to get lcrit_alarm or similar I'd have to "trick" pmbus into thinking 
limits are being provided by the PS. This seems more simple.

Thanks,
Eddie

>
>> +in1_input              Measured input voltage in mV.
>> +in1_label              "vin"
>> +in2_alarm              Output voltage over-voltage fault.
>> +in2_input              Measured output voltage in mV.
>> +in2_label              "vout1"
>> +
>> +power1_input           Measured input power in uW.
>> +power1_label           "pin"
>> +
>> +temp1_alarm            PSU inlet ambient temperature over-temperature fault.
>> +temp1_input            Measured PSU inlet ambient temp in millidegrees C.
>> +temp2_alarm            Secondary rectifier temp over-temperature fault.
>> +temp2_input            Measured secondary rectifier temp in millidegrees C.
>> +temp3_alarm            ORing FET temperature over-temperature fault.
>> +temp3_input            Measured ORing FET temperature in millidegrees C.
>> --
>> 1.8.3.1
>>
