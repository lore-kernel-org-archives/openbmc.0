Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xLTM41wZzDr30
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 18:38:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4V8Z54m140682
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 04:38:28 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jab5qwyae-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 04:38:28 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 31 May 2018 02:38:27 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 31 May 2018 02:38:26 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4V8cPW711141612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 May 2018 01:38:25 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BD4CBE03A;
 Thu, 31 May 2018 02:38:25 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.205.11])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id A3F88BE039;
 Thu, 31 May 2018 02:38:24 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 2E8C04EC638; Thu, 31 May 2018 18:38:23 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Security Working Group Kick Off
In-Reply-To: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
References: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
Date: Thu, 31 May 2018 18:38:23 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18053108-0012-0000-0000-0000165BA251
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009101; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01040218; UDB=6.00532463; IPR=6.00819347; 
 MB=3.00021391; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-31 08:38:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18053108-0013-0000-0000-0000530E5A70
Message-Id: <87efhs43uo.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-31_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=878 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1805310097
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
X-List-Received-Date: Thu, 31 May 2018 08:38:32 -0000

Nancy Yuen <yuenn@google.com> writes:
> The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
> 31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
> are interested in participating in this working group.

Would topics like "security of the BMC from a hostile host" be part of
this?

A design of OpenPOWER systems is that the BMC and the Host don't have to
trust each other, and this should extend to a host that's hostile
towards the BMC.

I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
we started fuzzing those interfaces.

-- 
Stewart Smith
OPAL Architect, IBM.
