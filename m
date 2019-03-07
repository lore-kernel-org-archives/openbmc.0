Return-Path: <zshelle@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fmh13dCQzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 10:15:24 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x27NAEi2058620
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 18:15:22 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r3a2sq1cp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 18:15:21 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.ibm.com>;
 Thu, 7 Mar 2019 23:15:21 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Mar 2019 23:15:19 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x27NFIAg11927710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 23:15:18 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAEBF124054
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 23:15:18 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42E87124058
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 23:15:18 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 23:15:17 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 07 Mar 2019 17:23:01 -0600
From: Zane Shelley <zshelle@linux.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: requirements for new repos
Organization: IBM
In-Reply-To: <CAO=notyvofZyhDJ-uZ1euNL=tXNHckNjNPtfVQuq5GR6WgEfKA@mail.gmail.com>
References: <c07297eeb5a0a7415a250a1a9e77e5e2@linux.vnet.ibm.com>
 <CAO=notyvofZyhDJ-uZ1euNL=tXNHckNjNPtfVQuq5GR6WgEfKA@mail.gmail.com>
X-Sender: zshelle@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030723-0072-0000-0000-00000406E5D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010723; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01171110; UDB=6.00612116; IPR=6.00951754; 
 MB=3.00025884; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-07 23:15:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030723-0073-0000-0000-00004B6A387A
Message-Id: <bc8a3c9a563a47df0d9a3a4ecd7563d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=998 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070152
X-Mailman-Approved-At: Tue, 12 Mar 2019 14:45:26 +1100
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
X-List-Received-Date: Thu, 07 Mar 2019 23:15:30 -0000

On 2019-03-07 13:24, Patrick Venture wrote:
> On Thu, Mar 7, 2019 at 8:43 AM zshelle <zshelle@linux.vnet.ibm.com> 
> wrote:
>> 
>> Besides the license and maintainers files, are there any other general
>> requirements for each repo?
> 
> You'll want a bootstrap.sh script for the CI to hit.  This'll run our
> normal validation.  There's additionally a .clang-format file that'll
> ensure conformance to the style guide.
> 
>> 

Thanks! Will look into it.

-- 
- Zane
