Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJk8j15nhzDvhX
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 23:29:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAGCSoqe008204
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 07:29:23 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26rfhxt8as-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 07:29:22 -0500
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 16 Nov 2016 22:29:20 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 16 Nov 2016 22:29:19 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 130F03578053
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 23:29:19 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAGCTJ4U32178276
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 23:29:19 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAGCTIQT011235
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 23:29:18 +1100
Received: from Deepaks-MacBook-Pro.local ([9.79.254.2])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAGCTGxG011203; Wed, 16 Nov 2016 23:29:17 +1100
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: D-Bus interfaces for FRU VPD inventory
To: Yi TZ Li <shliyi@cn.ibm.com>
References: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
 <OFBF350957.8F8AAB7A-ON4825806D.0037DBBB-4825806D.003B431A@notes.na.collabserv.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 16 Nov 2016 17:59:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <OFBF350957.8F8AAB7A-ON4825806D.0037DBBB-4825806D.003B431A@notes.na.collabserv.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111612-0016-0000-0000-000001F10578
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111612-0017-0000-0000-000005DCB6CF
Message-Id: <8d28c804-fef4-c66a-c472-0c7ddf4c3866@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-16_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611160205
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
X-List-Received-Date: Wed, 16 Nov 2016 12:29:25 -0000

Hi Yi,


On 16/11/16 4:17 pm, Yi TZ Li wrote:
> Hi Deepak,
>
> I am reading your patch:
> https://gerrit.openbmc-project.xyz/#/c/1095/ and
> https://gerrit.openbmc-project.xyz/#/c/1094/,
> and the DBus interfaces you proposed.
>
> But I might miss some background information, hoping you could help:
>
> Please see my questions bellow:
>
>> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Date: 11/14/2016 02:59 PM
>> Subject: D-Bus interfaces for FRU VPD inventory
>> Sent by: "openbmc" <openbmc-bounces+shliyi=cn.ibm.com@lists.ozlabs.org>
>>
>> Hello,
>>
>> I'd like to solicit feedback on the d-bus interfaces that we're
>> defining to represent FRU information, also known as FRU VPD (Vital
>> Product Data).
>>
>> A little background :
>>
>> - The d-bus interfaces are being written as Inventory interfaces, as
>> YAML files, under the openbmc/phosphor-dbus-interfaces repo [1].
>
> What is the relationship between the YAML files in
> openbmc/phosphor-dbus-interfaces, and openbmc/phosphor-inventory-manager?
> Will phosphor-inventory-manager (PIM) uses the YAML files to generate
> dbus objects for FRU/VPD?

A VPD application will have to parse a specific format of VPD, then make 
use of PIM to create d-bus objects implementing the proposed d-bus 
interfaces. I think Brad would have details on how PIM is to be used in 
this regard.

>> - As far as sources/formats of VPD are concerned, we've looked at
>> the IPMI FRU information spec [2], and the open-power VPD format [3].
>
> Will BMC read and parse open-power format VPD? As I understand, Hostboot
> parses those VPD and send them to BMC as IPMI FRU format.
> Will BMC do the same thing as Hostboot?

You're right about hostboot. It's basically about who has access to the 
VPD eeprom. BMC would have to do it for certain FRUs. For eg BMC will 
have to parse the openpower VPD format and then will have to map that to 
the properties that we're proposing.

>> - The goal has been to define properties in the d-bus interfaces to
>> describe various pieces of FRU VPD, and to describe them in such a
>> way that they're agnostic to the VPD format. It would be up to VPD
>> related applications to parse specific VPD formats and then to
>> populate the Inventory via the new d-bus interfaces.
>> - There are in general two classes of interfaces : those describing
>> physical items such as processors, DIMMs, etc.; and those describing
>> virtual items such as a replaceable item, a repairable item, an item
>> having voltage control enabled, etc.
>
> Could you give an example of the "virtual items"?

I mentioned some examples above - an 'Asset' item, is another one.

> Also there are other FRU items like PCIE card, HDD. How to handle them
> in the new inventory framework?

Do you mean handle their VPD (if any), or in general creating d-bus 
objects for them? I'm not sure about the latter.

> Thanks,
> -Yi

Regards,
Deepak
