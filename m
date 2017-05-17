Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wSbgL6RW3zDqbB
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 00:05:18 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4HDwtJa144778
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 10:05:12 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2agmqqaghx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 10:05:07 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 18 May 2017 00:05:04 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 18 May 2017 00:05:04 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4HE4trb46989480
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 00:05:03 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v4HE4UHH030271
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 00:04:30 +1000
Received: from Deepaks-MacBook-Pro.local ([9.79.233.130])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v4HE4TlV029568
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 00:04:30 +1000
Subject: Re: Refactor phosphor-settingsd
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b2d26ce9-bb9e-218b-34b7-61bd260fdb73@linux.vnet.ibm.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 17 May 2017 19:34:15 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b2d26ce9-bb9e-218b-34b7-61bd260fdb73@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17051714-0048-0000-0000-0000022DFAAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051714-0049-0000-0000-000047DC8800
Message-Id: <3c2a6bd6-645f-6da0-96e7-b0804ee8ab4e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-17_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705170107
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
X-List-Received-Date: Wed, 17 May 2017 14:05:19 -0000

On 10/05/17 11:13 pm, Deepak Kodihalli wrote:
> Hello All,
>
> I'm working this sprint on refactoring the existing phosphor-settingsd
> application (https://github.com/openbmc/phosphor-settingsd). This
> application provides and implements interfaces to let the user configure
> system settings. One of the first goals is to write d-bus interfaces, in
> YAML, around various settings, and place them in the
> phosphor-dbus-interfaces repository.
>
> With the existing settings application, there isn't a clear schema
> around each setting, they are all described by a single
> org.openbmc.settings.Host interface. We'd ideally want an interface
> clearly describing each setting. That also makes it possible to
> implement settings d-bus objects as needed by a system.
>
> Looking for feedback on these points :
>
> 1) Where to place settings d-bus interfaces? For example let's say
> there's a "boot_media" setting which indicates the source of the host
> image (disk/network/etc). The interface could be either
> xyz/openbmc_project/Settings/Host/BootMedia.interface.yaml or
> xyz/openbmc_project/Control/Host/BootMedia.interface.yaml. Apart from
> organizational clarity, any other advantages of placing all Settings
> interfaces under a common 'Settings' namespace? Any disadvantages? Is it
> more intuitive to place the interfaces in an already existing namespace
> describing the object on which this setting applies? For instance, what
> would be the best place to house an interface describing a CPU setting?
> We already have an 'Inventory' namespace for items such as the CPU.
>
> 2) While 1) above is more of an organizational statement, the same
> problem applies to object paths of the d-bus objects implementing
> settings. An obvious advantage of having all settings d-bus objects
> under xyz/openbmc_project/settings/ would be that they are easy to find
> and enumerate. The disadvantage would be extra work to identify unique
> path names. The alternative would be to have the settings objects under
> the existing namespace of the object they are applied to, for example
> xyz/openbmc_project/inventory/system/motherboard/cpu0/some_cpu_setting.
> Any preferences here?
>
> 3) Creating system specific settings d-bus objects - this for example
> means certain settings d-bus objects nay not even be created for certain
> systems. I'm thinking this can be achieved via a policy file (in YAML),
> which states what settings interfaces to implement. If there's a
> possibility of different kind of objects implementing the same
> interface, or the same kind of objects implementing different
> interfaces, then the policy file will have to talk about objects as
> well. I guess point 2) has a bearing here.
>
> Thanks,
> Deepak


Based on the above I went ahead and put code for review. The d-bus 
interfaces are at https://gerrit.openbmc-project.xyz/#/c/4205/ and the 
settings manager application is at 
https://gerrit.openbmc-project.xyz/#/c/4244/. There's a README in this 
commit chain explaining some of the design.

I went the route of having a separate interface per setting, instead of 
a generic setting interface (having for example a single d-bus variant 
property) because with the latter there's no schema to define a setting. 
For instance, a setting could actually be more than one property, or be 
an enumeration.

Thanks,
Deepak
