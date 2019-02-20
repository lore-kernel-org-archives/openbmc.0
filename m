Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444WGb2DDszDqMB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 08:39:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1KLX7W0130924
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 16:39:48 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qsewe87u3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 16:39:48 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Wed, 20 Feb 2019 21:39:46 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Feb 2019 21:39:43 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1KLdgqM23134396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Feb 2019 21:39:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93164124054;
 Wed, 20 Feb 2019 21:39:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60E64124052;
 Wed, 20 Feb 2019 21:39:42 +0000 (GMT)
Received: from [9.10.99.45] (unknown [9.10.99.45])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Feb 2019 21:39:42 +0000 (GMT)
Subject: Re: sensor->inventory associations in phosphor-hwmon
To: James Feist <james.feist@linux.intel.com>,
 Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <23eeb05bb818341a140e51ff183109ba@linux.vnet.ibm.com>
 <CAO=notyk=xCUzcqJcMfvpAJx=dNgAw=_pudiTHX74iw1_eAr4w@mail.gmail.com>
 <ff9414df-0052-9112-5d34-0f3b8661434f@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Wed, 20 Feb 2019 15:39:42 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ff9414df-0052-9112-5d34-0f3b8661434f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022021-0060-0000-0000-0000030E3AB8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010634; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01163952; UDB=6.00607786; IPR=6.00944537; 
 MB=3.00025671; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-20 21:39:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022021-0061-0000-0000-0000485DF463
Message-Id: <acc59942-39ff-59bf-6cea-d1c806148e30@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-20_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902200145
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
X-List-Received-Date: Wed, 20 Feb 2019 21:39:51 -0000


On 2/20/2019 12:47 PM, James Feist wrote:
> On 2/20/19 10:32 AM, Patrick Venture wrote:
>> On Wed, Feb 20, 2019 at 10:31 AM Matt Spinler 
>> <mspinler@linux.ibm.com> wrote:
>>>
>>> Hi,
>>>
>>> We have a need to know which sensor objects hosted by the various
>>> phosphor-hwmon
>>> daemons belong to which inventory objects.  For example, we need to 
>>> know
>>> that
>>> the /xyz/openbmc_project/sensors/power/ps1_input_power sensor 
>>> belongs to
>>> the
>>> /xyz/openbmc_project/inventory/system/powersupply1 item.
>>>
>>> To accomplish this, I am proposing we add a new environment variable to
>>> the
>>> system specific phosphor-hwmon config files that the phosphor-hwmon 
>>> code
>>> can then use to create associations interfaces that will cause the
>>> mapper to
>>> create the appropriate association D-Bus paths.
>>>
>>> As an example, we could add to the power-supply1 conf file an
>>> ASSOCIATIONS
>>> variable for each sensor (assuming ps1_input_power is represented by
>>> IN1):
>>>
>>> ASSOCIATIONS_IN1=/xyz/openbmc_project/inventory/system/powersupply1
>>>
>>> The code would then see that and create a new org.openbmc.Associations
>>> interface
>>> on the /xyz/openbmc_project/sensors/power/ps1_input_power path with an
>>> associations property of:
>>>
>>>       ["inventory",
>>>        "sensors",
>>>        "/xyz/openbmc_project/inventory/system/powersupply1"]
>>>
>>> This leads to the mapper creating:
>>>
>>> /xyz/openbmc_project/sensors/power/ps1_input_power/inventory
>>>
>>> With an xyz.openbmc_project.Association interface with an
>>> endpoints property of:
>>>
>>>       ["/xyz/openbmc_project/inventory/system/powersupply1"]
>>>
>>> And also the other association path:
>>>
>>> /xyz/openbmc_project/inventory/system/powersupply1/sensors
>>>
>>> With an xyz.openbmc_project.Association interface with an
>>> endpoints property of:
>>>
>>>       ["/xyz/openbmc_project/sensors/power/ps1_input_power"]
>>>
>>> This now allows one to both find all sensors associated with a power
>>> supply, and
>>> find which inventory item is associated with a particular sensor.  Note
>>> that
>>> the endpoints property is an array, and can get entries from multiple
>>> places.
>>>
>>> I suppose we could also put the forward/reverse association names, in
>>> this case
>>> "inventory" and "sensors", into the hwmon config file, and also allow
>>> creating
>>> multiple associations for each sensor if there is a usecase, though I
>>> would like
>>> to keep it as simple as possible:
>>>
>>> ASSOCIATIONS1_IN1=inventory,sensors,/xyz/openbmc_project/inventory/system/powersupply1 
>>>
>>> ASSOCIATIONS2_IN1=chassis,contained_sensors,/xyz/openbmc_project/inventory/system/chassis 
>>>
>>>
>>> What does everyone think?
>>
>> I think it's useful and straightforward to use, and easy to test.
>
> Have we considered the alternative of the inventory item creating the 
> association? I only ask because in the past we've tried to keep 
> redfish/ipmi specific things outside of the sensors. I think this 
> proposal works fine btw, just seems like the alternative would work as 
> well and would keep sensors as just 'sensors'.
>

After our discussion on IRC, I will look into adding the functionality 
in phosphor-inventory-manager to add any required inventory 
associations, which would cover LEDs, sensors, etc, and then you can do 
the same for Entity-Manager.  That way, the bmcweb Redfish code that 
would use these can be common.


> -James
>
>>
>>>
>>> Thanks
>>> Matt
>>>
>
