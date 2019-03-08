Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fwq10zDXzDqH6
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 16:22:04 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x285DdUP102880
 for <openbmc@lists.ozlabs.org>; Fri, 8 Mar 2019 00:22:02 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r3gsg3038-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Mar 2019 00:22:01 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 8 Mar 2019 05:22:00 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Mar 2019 05:21:57 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x285LudH29753392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Mar 2019 05:21:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 606D6A404D;
 Fri,  8 Mar 2019 05:21:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C03EAA4059;
 Fri,  8 Mar 2019 05:21:55 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.217])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Mar 2019 05:21:55 +0000 (GMT)
Subject: Re: Initial MCTP design proposal
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Ed Tanous <ed.tanous@intel.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
 <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
 <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
 <ad89021d-57a9-980a-6034-8530b81b975c@intel.com>
 <76923984-3d27-581b-0541-ae571a441e2d@linux.vnet.ibm.com>
 <3447b96c-2a52-660a-3015-22b559242c0d@intel.com>
 <847a41e2-59cd-47dd-ac1c-7d6c433e003d@linux.vnet.ibm.com>
Date: Fri, 8 Mar 2019 10:51:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <847a41e2-59cd-47dd-ac1c-7d6c433e003d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19030805-0008-0000-0000-000002CA158E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030805-0009-0000-0000-0000223625EC
Message-Id: <c3305f0e-fca2-9758-2908-1ba73e944858@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-08_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=886 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903080036
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
X-List-Received-Date: Fri, 08 Mar 2019 05:22:05 -0000

On 08/03/19 10:28 AM, Deepak Kodihalli wrote:
> On 08/03/19 1:05 AM, Ed Tanous wrote:
>>
>>
>> On 3/7/19 12:46 AM, Deepak Kodihalli wrote:
>>>
>>> I agree to this as well. I've got two PLDM stacks on my laptop
>>> (requester and responder) talking to each other over libmctp (over the
>>> serial binding - making use of fifos instead of an actual serial
>>> connection). I'd like to push a couple small commits to libmctp as well
>>> (I made a PR for one of them at the moment).
>> This is one thing I've wondered before about the way PLDM is being built
>> out.  Testing the implementation against itself doesn't really test the
>> correctness of it, unless you're creating a bunch of asserts on data
>> structure elements, and even then, it just tests that you're giving what
>> you expect, not that you faithfully implemented the spec.


Also, the application was not tested against itself. The application is 
mostly a responder now. It was tested against a requester 
implementation. This commit chain might help clarify : 
https://gerrit.openbmc-project.xyz/#/c/openbmc/pldm/+/19011/

>> Do you plan to run this implementation against something other than
>> itself to test at some point?  If so, what device/implementation are you
>> planning to target?
> 
> BMC to host communications over MCTP, over different physical channels 
> (LPC for eg), is one of the first goals. There are more details in the 
> PLDM/MCTP design docs that Jeremy and I had sent out.
> 
> The test that I described above was to integrate the PLDM stack with 
> libmctp and see how that goes, without having to wait for another device 
> implementation to be ready. I think this is a logical step towards 
> employing PLDM/MCTP for device-device communication. The PLDM daemon 
> will link with the MCTP libs, eventually.
> 
> Regards,
> Deepak
> 
