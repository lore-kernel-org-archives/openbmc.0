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
 by lists.ozlabs.org (Postfix) with ESMTPS id 449Qvv39bTzDqQ9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 08:40:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1SLY5LQ019192
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 16:40:41 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qxnmwp0jy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 16:40:40 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Thu, 28 Feb 2019 21:40:39 -0000
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Feb 2019 21:40:36 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1SLeZxb21168296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Feb 2019 21:40:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4904028064;
 Thu, 28 Feb 2019 21:40:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C836D28059;
 Thu, 28 Feb 2019 21:40:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 28 Feb 2019 21:40:34 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 28 Feb 2019 15:48:00 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: "Mazur, Marta" <marta.mazur@intel.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: bashisms in meta-phosphor scripts
In-Reply-To: <57D4E00C36C60342B4DF4D5243A0FFBF4F8E41A1@IRSMSX103.ger.corp.intel.com>
References: <57D4E00C36C60342B4DF4D5243A0FFBF4F8E41A1@IRSMSX103.ger.corp.intel.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19022821-0040-0000-0000-000004C99028
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010682; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01167755; UDB=6.00606765; IPR=6.00948368; 
 MB=3.00025784; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-28 21:40:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022821-0041-0000-0000-000008D498BD
Message-Id: <1dcffdb01b9788a2659f7e5680f0d6da@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-28_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902280143
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
X-List-Received-Date: Thu, 28 Feb 2019 21:40:44 -0000

On 2019-02-19 13:08, Mazur, Marta wrote:
> Hi all,
> 
> We have to cut out bash from our system and use busybox ash as the
> only shell. I found several scripts in the meta-phosphor layer that
> are not POSIX compliant and therefore are unusable without bash.

Why do you need to drop bash?  Licensing?  To save space?


> Has anyone run into this problem? Does anyone have plans to remove
> bash dependencies from this layer?

I haven't heard of any such plans, nor did I find any in the email 
archives: https://lists.ozlabs.org/pipermail/openbmc/


> Or maybe we could patch those scripts and submit the patches to
> upstream? It should increase portability to systems with any POSIX
> shell.

That approach could work.  Before you get started, we should discuss the 
idea of not using POSIX scripts and not using bashisms.
If there is agreement, you might want to first document the issue here: 
https://github.com/openbmc/docs/blob/master/anti-patterns.md

- Joseph

> Regards,
> 
> Marta
> 
> ---------------------------------------------------------------------
>  Intel Technology Poland sp. z o.o.
> ul. S&#322owackiego 173 | 80-298 Gda&#324sk | S&#261d Rejonowy
> Gda&#324sk P&#243&#322noc | VII Wydzia&#322 Gospodarczy Krajowego
> Rejestru S&#261dowego - KRS 101882 | NIP 957-07-52-316 | Kapita&#322
> zak&#322adowy 200.000 PLN.
> 
>  Ta wiadomo&#347&#263 wraz z za&#322&#261cznikami jest przeznaczona
> dla okre&#347lonego adresata i mo&#380e zawiera&#263 informacje
> poufne. W razie przypadkowego otrzymania tej wiadomo&#347ci, prosimy o
> powiadomienie nadawcy oraz trwa&#322e jej usuni&#281cie; jakiekolwiek
> przegl&#261danie lub rozpowszechnianie jest zabronione.
>  This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). If you are not the intended
> recipient, please contact the sender and delete all copies; any review
> or distribution by others is strictly prohibited.
