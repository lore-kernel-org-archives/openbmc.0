Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FfrM5qJSzF1Hl
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 07:51:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5QLi4OE021378
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 17:51:21 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2juuc7d7mu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 17:51:21 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Tue, 26 Jun 2018 15:51:20 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 26 Jun 2018 15:51:16 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w5QLpFxS5964238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jun 2018 14:51:15 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EFBC7805C;
 Tue, 26 Jun 2018 15:51:15 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9BF78064;
 Tue, 26 Jun 2018 15:51:14 -0600 (MDT)
Received: from [9.10.223.143] (unknown [9.10.223.143])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jun 2018 15:51:14 -0600 (MDT)
Subject: Re: OpenBMC Release Planning WG Kickoff Meeting
To: Kurt Taylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Mihm, James" <james.mihm@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, sdasari@fb.com,
 Ali Larijani <alirhas@microsoft.com>, Nancy Yuen <yuenn@google.com>,
 Dick Wilkins <Dick_Wilkins@phoenix.com>
References: <CAG5OiwjQA41nZP1Usj-0kk4bTWvac0mbmK=VU4jhZ2uS7W+-Jw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Tue, 26 Jun 2018 16:51:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAG5OiwjQA41nZP1Usj-0kk4bTWvac0mbmK=VU4jhZ2uS7W+-Jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18062621-0004-0000-0000-0000145A77A3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009260; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01052762; UDB=6.00539725; IPR=6.00830687; 
 MB=3.00021869; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-26 21:51:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062621-0005-0000-0000-000087E0D9B9
Message-Id: <f1991e90-ceb5-78a9-38d5-0098a1e33dee@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=764 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1806260240
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
X-List-Received-Date: Tue, 26 Jun 2018 21:51:32 -0000

Hi Kurt,

On 6/26/2018 2:26 PM, Kurt Taylor wrote:

> I still have not heard from Facebook or Microsoft, but the majority of 
> responses were for Thursday at 3:00pm Central US (2000 UTC) so we will 
> start there.

Please add me to the list.

> If you have not replied, please do as I will only invite those that 
> reply (call info will not be made public).

Why not make the call info public?


Thanks,
Gunnar
