Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlbm853fYzDr98
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 08:02:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1JKo8S8046913
 for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2018 16:02:13 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2g85kfh7w2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2018 16:02:12 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 19 Feb 2018 16:02:12 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 19 Feb 2018 16:02:09 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1JL28KG57999588; Mon, 19 Feb 2018 21:02:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A3E8B2056;
 Mon, 19 Feb 2018 17:04:27 -0500 (EST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id D16F1B2052;
 Mon, 19 Feb 2018 17:04:26 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Feb 2018 15:04:02 -0600
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, joel.stan@gmail.com
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <CACPK8XfEw9aokeFW10yV=pTbKympFCPNRO9Am8mBQ2GF0NVZRA@mail.gmail.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
 <634e8e59f56c0f62e78ece56048c8059@linux.vnet.ibm.com>
 <4a56656038f76ea3a40736f2f824d642@linux.vnet.ibm.com>
 <CACPK8XfEw9aokeFW10yV=pTbKympFCPNRO9Am8mBQ2GF0NVZRA@mail.gmail.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18021921-0024-0000-0000-000003290C69
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008561; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00992157; UDB=6.00504026; IPR=6.00771503; 
 MB=3.00019641; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-19 21:02:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021921-0025-0000-0000-00004715100B
Message-Id: <7ff8497d627ffd74c3d43b06bdc6caa4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-19_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802190259
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Feb 2018 21:02:17 -0000


> 
> What do you mean unsharable?
> 

The public keys only apply to the BMC where the firmware image is being 
installed on and not are not intended to be shared with other BMCs / 
hosts. "Shareable files can be stored on one host and used on several 
others" (http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch02.html).


On another note, I'll be adding the gerrit links to the main epic 
(https://github.com/openbmc/openbmc/issues/356) as changes start getting 
submitted for anyone that wants to leave comments or follow along. The 
first ones are:

https://gerrit.openbmc-project.xyz/#/c/8949/ - Add image signing 
framework and open keys
https://gerrit.openbmc-project.xyz/#/c/9025/ - BMC Digital Signature 
documentation
