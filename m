Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sG7J625TzF1HF
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 03:08:44 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4OH4JfE106967
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 13:08:42 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j5xsq93be-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 13:08:41 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 24 May 2018 13:08:40 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 May 2018 13:08:37 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4OH8aq311469144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 May 2018 17:08:37 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88F5E28058;
 Thu, 24 May 2018 13:08:25 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C42B2805C;
 Thu, 24 May 2018 13:08:25 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 May 2018 13:08:25 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 24 May 2018 12:12:17 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Lei YU
 <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <20180522182824.GE105329@mauery>
References: <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
 <20180518210254.GC105329@mauery>
 <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
 <20180522153024.GD105329@mauery> <20180522182824.GE105329@mauery>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18052417-0040-0000-0000-0000043151CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036001; UDB=6.00529949; IPR=6.00815130; 
 MB=3.00021234; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-24 17:08:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052417-0041-0000-0000-000008376F0F
Message-Id: <e852980c650798a5b6b431324d9918a4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805240194
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
X-List-Received-Date: Thu, 24 May 2018 17:08:45 -0000

On 2018-05-22 13:28, Vernon Mauery wrote:
> 
> One other thought I had was that we could make the manifest a JSON
> file which makes for very simple parsing (since the parser is already
> written).  Then we could go with something like this:
> 

That's a good option, at least for the write to flash piece. We could
even extend the manifest to include the names of the service files to
delete/clean up the flash. Most of the rest of the code manages the
D-Bus objects so that'd be common with all flash layouts.

Another option, or combination with a json manifest, would be to have
different repos or different subdirectories for specific 
implementations.


Lei, thinking we could convert Romulus to ubi, and use the PNOR chip
to store the alternate BMC version. I think that'd be more straight fwd
and the advantage would be that the interfaces are tested and verified.
And on the side we can continue this discussion on how to make the
code more modular to support other layouts and we can start making
the changes but at least we can get Romulus using signature validation
in the mean time.
