Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439Dvs5mDjzDr3M
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 10:09:45 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wB5N92tl030353
 for <openbmc@lists.ozlabs.org>; Wed, 5 Dec 2018 18:09:42 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p6mn00nsa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Dec 2018 18:09:42 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Wed, 5 Dec 2018 23:09:41 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Dec 2018 23:09:39 -0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wB5N9clQ11010226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 5 Dec 2018 23:09:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ACC46E053
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 23:09:38 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA4396E050
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 23:09:37 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 23:09:36 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Dec 2018 17:13:28 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Add TARGET_MACHINE to /etc/os-release
In-Reply-To: <0b82208977f8010c41e35cc7e35e267d@linux.vnet.ibm.com>
References: <mailman.11506.1542344002.668.openbmc@lists.ozlabs.org>
 <966f717c-59a9-7f88-7b37-91edb9d72276@charter.net>
 <FA5A8B03-6706-4072-A1A9-EE8B1BC1575F@fuzziesquirrel.com>
 <0b82208977f8010c41e35cc7e35e267d@linux.vnet.ibm.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18120523-0012-0000-0000-000016E52061
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010178; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01127532; UDB=6.00585664; IPR=6.00907667; 
 MB=3.00024466; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-05 23:09:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120523-0013-0000-0000-0000555A1B31
Message-Id: <2b69aaa0be31681792a08367a4dbe854@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=950 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812050203
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
X-List-Received-Date: Wed, 05 Dec 2018 23:09:46 -0000

On 2018-11-29 17:03, Joseph Reynolds wrote:
>> Proposal to add TARGET_MACHINE to /etc/os-release.
> 

I've pushed this as gerrit review 16489.

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/16489/

> I've updated the details to explain why the uname command is 
> unsatisfactory.
> 
>> 
>> In an OpenBMC image, the /etc/os-release file includes distro 
>> ("openbmc-phosphor") and version (as a git tag or commit).  It should 
>> also include the target machine (the kind of device the OpenBMC image 
>> is intended to control).  This is needed to be able to track the image 
>> back to its source code: the distro and version indicate the exact 
>> source code that was used, and the target says which Bitbake layer 
>> configuration within that source was used.
>> 
>> Specifically, the proposal is to enhance the generated /etc/os-release 
>> file with a new OS identification parameter like:
>>   OPENBMC_PHOSPHOR_TARGET_MACHINE="$MACHINE"
>> where MACHINE="romulus", for example.
>> 
>> All OpenBMC images should define this os-release parameter.
>> 
>> Proposed documentation for the new parameter: Indicates the kind of 
>> device the OpenBMC image is targeted to control.
>> 
>> ... tl;dr details follow ... snip ...
>> 
>> The MACHINE is set in 
>> openbmc/meta-COMPANY/meta-MACHINE/conf/local.conf.sample.  (This is 
>> where TEMPLATECONF points to.)
>> 
>> Note MACHINE is not guaranteed to be unique across all future OpenBMC 
>> layer configurations.  (That is, meta-A/meta-B/conf and 
>> meta-X/meta-Y/conf may inadvertently define the same machine name.) To 
>> guarantee uniqueness, an alternate design would be to use the 
>> TEMPLATECONF parameter as the machine name. (e.g., 
>> "meta-ibm/meta-romulus/conf").  In practice I expect the machine name 
>> will be sufficiently unique: as unique as different company's brand 
>> and model names.
>> 
>> The manual page for "os-release" recommends prefixing the parameter 
>> name with the distro name.  Ideas for alternate parameter names are 
>> welcome ("OBMC_TARGET_HARDWARE" anyone?).  See 
>> https://www.freedesktop.org/software/systemd/man/os-release.html.
>> 
>> The os-release file is generated by the os-release.bb and 
>> os-release.bbappend recipes.
> 
> The "uname" command options -m (machine) and -i (hardware platform)
> will continue to refer to the BMC and not its host.
