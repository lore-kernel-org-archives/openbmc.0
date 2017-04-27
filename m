Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDMN543rbzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 02:09:41 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3RG9R2B125899
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:09:34 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a2xcn6t4a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:09:34 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Thu, 27 Apr 2017 10:09:21 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 27 Apr 2017 10:09:18 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3RG9IFX15073592; Thu, 27 Apr 2017 09:09:18 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14E25136049;
 Thu, 27 Apr 2017 10:09:18 -0600 (MDT)
Received: from [9.10.254.182] (unknown [9.10.254.182])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 6F842136040;
 Thu, 27 Apr 2017 10:09:17 -0600 (MDT)
Subject: Re: Switching to 4.10
To: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Edward James <eajames@us.ibm.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Thu, 27 Apr 2017 11:09:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17042716-0016-0000-0000-000006A2A10E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006983; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00853267; UDB=6.00421858; IPR=6.00632104; 
 BA=6.00005316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015207; XFM=3.00000014;
 UTC=2017-04-27 16:09:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17042716-0017-0000-0000-000039522410
Message-Id: <a0cb1ba8-19e0-bbdf-d343-7463395e72bf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-27_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704270264
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
X-List-Received-Date: Thu, 27 Apr 2017 16:09:42 -0000



On 04/27/17 2:33 AM, Joel Stanley wrote:
> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
>> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has a
>> defconfig for ast2400.  If you have one for ast2500, please upload a new
>> patch set to that change.
> I have defconfigs in the tree that are ready to go. I will upload them
> to Gerrit when I get the chance.
>
> I've pulled in:
>
>   - Ben's ftgmac100 patches from the net-next tree
>   - Brendan's i2c patches, v7
>   - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
>   - Chris Bostic's FSI series, v6
>
> These are going through a test cycle on the ast2500evb and Plametto
> tonight. Once I have an ack for the i2c device tree, I will add that
> to the tree and push to github.
>
> Eddie, can you let me know which version of your OCC hwmon patches you
> want included. Same goes for the CFAM I2C patches. If you want to wait
> for review then please ping your reviewers and we can see if we can
> get the patches reviewed before we include them.
>
> Brad, can you point me to the SBE FIFO work that you want included. If
> you would prefer to wait for review that is okay.
>
> Matt, I think do you want to merge the MAX31785 hwmon driver as-is for now?
I thought we already have a MAX31785 driver merged, so what is 
'as-is'...does that include the update supporting reading the tach 
feedback from both rotors as described in 
issue#652(https://github.com/openbmc/openbmc/issues/652)? The commit you 
referenced in that issue does not have the dual tach feedback support yet.

At this point in time, it's important we get the MAX31785 driver updated 
with this support along with the PCA9552 driver presence & led 
verification of the fan enclosures.

Thanks,

Matt
>
> Cheers,
>
> JOel
>
>> On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <xow@google.com> wrote:
>>> On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
>>>> Hi Joel,
>>>>
>>>> On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>>>>> Hello team,
>>>>>
>>>>> I want to make the 4.10 change happen. We don't have the resource to
>>>>> be maintaining two trees, and the 4.10 tree has a whole heap of
>>>>> shinyness - faster network, faster flash access, improved I2C.
>>>>>
>>>>> To this end I will stop merging patches in to 4.7. Please target the
>>>>> 4.10 tree from here on.
>>>>>
>>>>> Use this thread to discuss concerns and coordinate the work that needs
>>>>> to be done. Bits that I'm aware of
>>>>>
>>>>>   - Eddie is updating userspace to the new FSI APIs
>>>>>   - I need to merge the upstream FSI patchset
>>>>>   - Brednan needs to post the lastest version of the i2c patchset which
>>>>> I will merge
>>>>>   - I need to merge benh's ftgmac100 improvements
>>>> We'll need to update the defconfig in the build system. Currently if I
>>>> compile the kernel and generate a new defconfig (make savedefconfig),
>>>> I see the following changes in the 4.10 generated defconfig:
>>>>
>>>> @@ -73,7 +73,6 @@
>>>>   CONFIG_MTD_BLOCK=y
>>>>   CONFIG_MTD_PARTITIONED_MASTER=y
>>>>   CONFIG_MTD_SPI_NOR=y
>>>> -CONFIG_ASPEED_FLASH_SPI=y
>>>>   CONFIG_MTD_UBI=y
>>>>   CONFIG_MTD_UBI_FASTMAP=y
>>>>   CONFIG_MTD_UBI_BLOCK=y
>>>> @@ -116,7 +115,6 @@
>>>>   # CONFIG_SERIO is not set
>>>>   # CONFIG_VT is not set
>>>>   CONFIG_LEGACY_PTY_COUNT=4
>>>> -# CONFIG_DEVKMEM is not set
>>>>   CONFIG_SERIAL_8250=y
>>>>   # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>>>   CONFIG_SERIAL_8250_CONSOLE=y
>>>> @@ -131,10 +129,8 @@
>>>>   CONFIG_I2C=y
>>>>   CONFIG_I2C_CHARDEV=y
>>>>   CONFIG_I2C_ASPEED=y
>>>> -CONFIG_SENSORS_MAX31785=y
>>>>   CONFIG_SENSORS_LM75=y
>>>>   CONFIG_SENSORS_NCT7904=y
>>>> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>>>>   CONFIG_PMBUS=y
>>>>   CONFIG_SENSORS_ADM1275=y
>>>>   CONFIG_SENSORS_UCD9000=y
>>>> @@ -143,21 +139,14 @@
>>>>   # CONFIG_USB_SUPPORT is not set
>>>>   CONFIG_NEW_LEDS=y
>>>>   CONFIG_LEDS_CLASS=y
>>>> -CONFIG_LEDS_GPIO=y
>>>>   CONFIG_LEDS_TRIGGERS=y
>>>>   CONFIG_LEDS_TRIGGER_TIMER=y
>>>>   CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>>>> -CONFIG_LEDS_TRIGGER_GPIO=y
>>>>   CONFIG_RTC_CLASS=y
>>>>   CONFIG_RTC_DRV_DS1307=y
>>>>   CONFIG_RTC_DRV_ASPEED=y
>>>>   CONFIG_MAILBOX=y
>>>> -CONFIG_ASPEED_MBOX=y
>>>>   # CONFIG_IOMMU_SUPPORT is not set
>>>> -CONFIG_FSI=y
>>>> -CONFIG_FSI_MASTER_GPIO=y
>>>> -CONFIG_FSI_SCOM=y
>>>> -CONFIG_FSI_I2C=y
>>>>   CONFIG_FIRMWARE_MEMMAP=y
>>>>   CONFIG_FANOTIFY=y
>>>>   CONFIG_AUTOFS4_FS=y
>>>>
>>>>> Cheers,
>>>>>
>>>>> Joel
>>>> I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
>>>> I've yet to look at each of the other differences.
>>>>
>>>> cheers
>>>> xo
>>> OK, I guess it's not that much work to look at those configs. This
>>> seems to work up to the limit of the missing FSI drivers as previously
>>> mentioned:
>>>
>>> ---
>>> a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>>> +++
>>> b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>>> @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
>>>   CONFIG_MTD_BLOCK=y
>>>   CONFIG_MTD_PARTITIONED_MASTER=y
>>>   CONFIG_MTD_SPI_NOR=y
>>> -CONFIG_ASPEED_FLASH_SPI=y
>>> +CONFIG_SPI_ASPEED_SMC=y
>>>   CONFIG_MTD_UBI=y
>>>   CONFIG_MTD_UBI_FASTMAP=y
>>>   CONFIG_MTD_UBI_BLOCK=y
>>> @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
>>>   # CONFIG_SERIO is not set
>>>   # CONFIG_VT is not set
>>>   CONFIG_LEGACY_PTY_COUNT=4
>>> -# CONFIG_DEVKMEM is not set
>>>   CONFIG_SERIAL_8250=y
>>>   # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>>   CONFIG_SERIAL_8250_CONSOLE=y
>>> @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
>>>   CONFIG_I2C=y
>>>   CONFIG_I2C_CHARDEV=y
>>>   CONFIG_I2C_ASPEED=y
>>> -CONFIG_SENSORS_MAX31785=y
>>> +CONFIG_GPIOLIB=y
>>> +CONFIG_GPIO_SYSFS=y
>>> +CONFIG_GPIO_ASPEED=y
>>>   CONFIG_SENSORS_LM75=y
>>>   CONFIG_SENSORS_NCT7904=y
>>> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>>>   CONFIG_PMBUS=y
>>>   CONFIG_SENSORS_ADM1275=y
>>>   CONFIG_SENSORS_UCD9000=y
>>> @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
>>>   CONFIG_RTC_DRV_DS1307=y
>>>   CONFIG_RTC_DRV_ASPEED=y
>>>   CONFIG_MAILBOX=y
>>> -CONFIG_ASPEED_MBOX=y
>>> +CONFIG_ASPEED_LPC_MBOX=y
>>>   # CONFIG_IOMMU_SUPPORT is not set
>>> -CONFIG_FSI=y
>>> -CONFIG_FSI_MASTER_GPIO=y
>>> -CONFIG_FSI_SCOM=y
>>> -CONFIG_FSI_I2C=y
>>>   CONFIG_FIRMWARE_MEMMAP=y
>>>   CONFIG_FANOTIFY=y
>>>   CONFIG_AUTOFS4_FS=y
>>>
>>> cheers
>>> xo
>>
