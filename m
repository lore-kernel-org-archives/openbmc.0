Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWwtF4btyzDrHc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2018 08:12:05 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0VL9wtu125431
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 16:12:02 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2fun1th1f7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 16:12:01 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 31 Jan 2018 14:12:01 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 31 Jan 2018 14:11:59 -0700
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0VLBxBJ9568512
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 14:11:59 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E29BBE040
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 14:11:59 -0700 (MST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 38FC4BE039
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 14:11:59 -0700 (MST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 31 Jan 2018 15:13:05 -0600
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <87lggezywe.fsf@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18013121-0020-0000-0000-00000D624E27
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008457; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00983165; UDB=6.00498598; IPR=6.00762448; 
 BA=6.00005806; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019308; XFM=3.00000015;
 UTC=2018-01-31 21:12:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013121-0021-0000-0000-00005FED3FB1
Message-Id: <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-31_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801310263
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 21:12:06 -0000

Thanks everybody for your thoughts so far. I'll try to comment on the 
remaining open questions.

Summarizing, there are 2 different verifications that are desired, one 
prior to writing the image to flash (using signature check), and one 
prior to booting the image (FIT verification).

1. Signature check

> Can you take a look at swupdate and reply with your thoughts?
Yes, thanks Andrew for looking and suggesting this.

> To overcome that the public key should be stored in OTP.
> We use this method on our Nuvoton Poleg BMC.
One concern would be if the key is deemed compromised. Avi, does the 
Nuvoton system have a mechanism for invalidating a key stored in OTP?
>> The "firmware update" public key in flash (and firmware update code 
>> itself) would be authenticated by BMC secure boot.
Per Eugene's comment, maybe we're ok with the key in flash?

> Whatever mechanism is used to generate the signature should be able to 
> be overridden by an environment variable or something.
Yes, good point Vernon.


2. FIT verification

> Regardless, with signed images we should expand the
> FIT hash check to be a full signature check.
Yes, I think there was some agreement on this statement during the 
hackaton.

> Also - has anybody mentioned using the FIT as a firmware update install 
> image, in addition to using to boot the kernel?(i.e. FIT within a FIT). 
> Think the native DFU command in u-boot supports this method. Just a 
> thought
Yes, ideally we'd implement FIT verification of the rootfs in addition 
to the kernel to verify an image before booting.
