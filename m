Return-Path: <zshelle@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FZCf0tkjzDqDb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 02:23:41 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x27FJEQs120918
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 10:23:39 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r355waq1x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 10:23:39 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.vnet.ibm.com>;
 Thu, 7 Mar 2019 15:23:38 -0000
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Mar 2019 15:23:36 -0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x27FNZ4p66650156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Mar 2019 15:23:35 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9AA86E04C;
 Thu,  7 Mar 2019 15:23:35 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0CBC6E04E;
 Thu,  7 Mar 2019 15:23:35 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  7 Mar 2019 15:23:35 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 07 Mar 2019 09:31:18 -0600
From: zshelle <zshelle@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+zshelle=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: New repo for System Fatal Error Diagnostics for POWER Systems
X-Sender: zshelle@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030715-0036-0000-0000-00000A95749A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010721; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170953; UDB=6.00612021; IPR=6.00951596; 
 MB=3.00025875; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-07 15:23:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030715-0037-0000-0000-00004AF486B4
Message-Id: <d6e3d6d445554e2c09ca723562b50429@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070104
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
X-List-Received-Date: Thu, 07 Mar 2019 15:23:42 -0000

On 2019-03-07 07:38, Brad Bishop wrote:
> On Tue, Mar 05, 2019 at 12:27:10PM -0600, zshelle wrote:
>> On 2019-02-28 10:38, zshelle wrote:
>>> The design proposal is here:
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/
>>> 
>>> In the design proposal, I indicated we need a repo for the analyzer
>>> side and the isolator side of the diagnostics. The analyzer side will
>>> all be OpenBMC specific code. That is the easy one. The isolator side
>>> will be common code used throughout several projects within OpenPOWER
>>> in addition to its application in OpenBMC. It's been pointed out to 
>>> me
>>> that there will be some convenient advantages to putting this 
>>> isolator
>>> repo in the OpenBMC project. However, it will be used heavily in
>>> several OpenPOWER projects. I should point out that while the 
>>> isolator
>>> is currently geared towards POWER, it has the potential to be used on
>>> other architectures in the future. I would appreciate any input on
>>> this topic.
>> 
>> Is there enough information in the proposal to at least get the repos 
>> created? Sorry to push, but I want to get these repos created before I 
>> am out on paternity leave starting this Friday.
>> 
>> For the analyzer, I was thinking of openpower-hw-diags or something 
>> along those lines.
>> 
>> I could use some suggestions for the isolator. It sounds like it could 
>> be used by more than POWER.
> 
> Hi Zane
> 
> openpower-hw-diags and openpower-libhei (as discussed in IRC) created.
> thx.
> 
> -brad

Awesome, thank you!
