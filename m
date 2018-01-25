Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSFCz5kGKzDrYZ
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 08:14:39 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0PLE7DI091027
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 16:14:36 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fqnw4tqg7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 16:14:33 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Thu, 25 Jan 2018 16:14:31 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 25 Jan 2018 16:14:30 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0PLEUiF50069568
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 21:14:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F728AE034
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 16:15:45 -0500 (EST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 5B182AE03B
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 16:15:45 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 25 Jan 2018 15:15:19 -0600
From: anoo <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: BMC Image Signing Proposal
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18012521-0056-0000-0000-000004104409
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008427; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00980310; UDB=6.00496946; IPR=6.00759611; 
 BA=6.00005795; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019211; XFM=3.00000015;
 UTC=2018-01-25 21:14:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012521-0057-0000-0000-00000847A90D
Message-Id: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-25_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801250281
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
X-List-Received-Date: Thu, 25 Jan 2018 21:14:40 -0000

Hi all,

During the hackaton meetup, we touched on BMC image verification and 
signing and concluded that the community would like to see two 
verification steps, one prior to writing the image to flash (via digital 
signature verification), and another one by checking FIT in U-Boot prior 
to booting from the new image.

The proposal would be to implement the digital signature verification 
first.

At a high level, during the build:
* A SHA-256 hash would be calculated over tbd files that make up the 
firmware image.
* The hash would be signed by a private key that's part of the 
repository (community key). Companies could overwrite it with their own 
private key when building production images.
* The encrypted hash (digital signature) and corresponding public key 
would be added to the firmware image.
* Yocto may already provide a way to sign images and generate keys.

On the BMC:
* The hash would be calculated on the image files that were uploaded to 
the BMC.
* The signature would be decrypted using an existing public key on the 
BMC (this validates the new public key delivered with the image is also 
valid).
* Accept image if both values are the same.

Any thoughts or comments?
