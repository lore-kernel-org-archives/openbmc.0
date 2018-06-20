Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419yGp5cTRzF0wb
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 07:13:06 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5KKs8iu141715
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 17:13:03 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jqvrjc4j2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 17:13:03 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 20 Jun 2018 17:13:02 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Jun 2018 17:12:59 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w5KLCwdW9437458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Jun 2018 21:12:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B9B7AC062;
 Wed, 20 Jun 2018 17:14:14 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C0E6AC059;
 Wed, 20 Jun 2018 17:14:13 -0400 (EDT)
Received: from [9.41.102.69] (unknown [9.41.102.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jun 2018 17:14:13 -0400 (EDT)
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@intel.com,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [RFC] IKVM prototype with only video
Date: Wed, 20 Jun 2018 16:12:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18062021-2213-0000-0000-000002BCD828
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009229; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000265; SDB=6.01049879; UDB=6.00537992; IPR=6.00828852; 
 MB=3.00021765; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-20 21:13:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062021-2214-0000-0000-00005A8CABB6
Message-Id: <ce8413d8-da27-99de-ad3b-8a353c4aa652@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=839 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806200227
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
X-List-Received-Date: Wed, 20 Jun 2018 21:13:07 -0000

Hi all,

I've been working on IKVM for OpenBMC and thought I would share my 
progress for any feedback. I have a working driver for the AST2500 video 
engine, and a functional view-only vnc server that runs on the BMC. This 
can be used to view the host graphics output (though it's not very 
interesting, just a login screen since I don't have any input working 
yet). I have it running at 24 fps, using ~2.8 Mbps network (the jpegs 
are about 15KB, x24 -> 380KB/s).

Here's the gerrit entry with everything: 
https://gerrit.openbmc-project.xyz/#/c/11206/

Here's my linux tree with the driver, in a pretty messy state. I wasn't 
able to get the streaming interface working with video4linux2, due to 
complications with how AST2500 engine handles the buffers, but 
performance isn't bad with basic read calls. The engine stays running 
and read() just grabs the latest frame. 
https://github.com/eddiejames/linux/commit/94b4c9b76d9ec58c5cc08527ca203741f17929c9

And here's the vnc server, which does require a small extension to 
libvncserver in order to transfer raw jpegs, and of course all the vnc 
code to only transfer changed blocks isn't used at all. 
https://github.com/eddiejames/obmc-ikvm

Let me know if anyone has any thoughts! Will work on getting input 
working next.

Thanks,

Eddie
