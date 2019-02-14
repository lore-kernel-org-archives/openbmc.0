Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440HKK3qZ7zDqL5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 11:27:33 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1E0JNMn125974
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 19:27:31 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qmt758vtp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 19:27:30 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Thu, 14 Feb 2019 00:27:30 -0000
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Feb 2019 00:27:27 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1E0RQVU19726370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Feb 2019 00:27:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C8DFBE051;
 Thu, 14 Feb 2019 00:27:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A72ABE04F;
 Thu, 14 Feb 2019 00:27:25 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Feb 2019 00:27:25 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Feb 2019 18:34:14 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Secure boot for BMC
In-Reply-To: <1550013215.2866613.1656755904.44211550@webmail.messagingengine.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
 <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
 <1550013215.2866613.1656755904.44211550@webmail.messagingengine.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19021400-0020-0000-0000-00000EBB771B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010591; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01160684; UDB=6.00605807; IPR=6.00941239; 
 MB=3.00025570; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-14 00:27:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021400-0021-0000-0000-000064CA37B6
Message-Id: <02642911831c76d37123735a2964984f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-13_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=608 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902140001
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
X-List-Received-Date: Thu, 14 Feb 2019 00:27:33 -0000

On 2019-02-12 17:13, Andrew Jeffery wrote:
> On Tue, 12 Feb 2019, at 11:00, Nancy Yuen wrote:
>> We are working on secure boot, but we have a requirement for a Google 
>> HW
>> root of trust so I'm not sure if that fits in with these discussions.
> 
> I think it would help to have some idea of Google's requirements so the 
> project
> can accommodate them where we can, if you can reveal any details. It 
> may also
> help inform others (me?) on strategies to secure firmware.

The OpenBMC security working group has discussed various "root of trust" 
ideas.  The way I understand it, OpenBMC community members are looking 
into different solutions including
"Secure Boot" and "Trusted Platform Module" (TPM) solutions, including 
Google's OpenTitan chip.  See the meeting minutes for details:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

My understanding of the "Secure Boot" concept is that some chip 
validates the boot loader's digital signature after loading it and 
before jumping into it.  Then the boot loader would validate the code it 
loads before jumping into it.  Etc.  A validation failure could either 
(a) cause the BMC to fail to boot, or (b) boot the BMC in failsafe mode 
where it could not write to its flash or talk to its host.  OpenBMC may 
also need some way to talk to the chip.

My understanding of TPMs is much more limited.  So we are waiting for 
proposals.

- Joseph

> Andrew
