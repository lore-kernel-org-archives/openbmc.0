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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vhM83QWBzF3G0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 08:57:55 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wADLs8GK175557
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 16:57:53 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2nr3vefrc5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 16:57:53 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Tue, 13 Nov 2018 21:57:52 -0000
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 13 Nov 2018 21:57:50 -0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wADLvn9319071216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 21:57:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 226A36A054
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 21:57:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 016116A04D
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 21:57:48 +0000 (GMT)
Received: from [9.10.252.52] (unknown [9.10.252.52])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 21:57:48 +0000 (GMT)
Subject: Re: Disabling ppc64le hosts for Qemu tests
To: openbmc@lists.ozlabs.org
References: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
 <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Tue, 13 Nov 2018 15:57:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18111321-0012-0000-0000-000016D9A2AE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010044; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01117015; UDB=6.00579335; IPR=6.00897124; 
 MB=3.00024147; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-13 21:57:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111321-0013-0000-0000-0000551A13C7
Message-Id: <f2e3ca81-4dbc-fe27-fbbd-17146d228348@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-13_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=708 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811130196
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
X-List-Received-Date: Tue, 13 Nov 2018 21:57:57 -0000


On 11/13/2018 2:29 PM, Andrew Geissler wrote:
> This feels like one of those things that's always tough to come back
> to once you let a workaround in. Is there a specific kernel commit
> you've bisected down to that we could just pull from the openbmc/linux
> tree? Is there a workaround we could put in our openbmc/qemu for
> now? I'd prefer both of these over just disabling ppc64le.


Agreed. Would rather not disable ppc64le or lose 25% of our build capacity.

Gunnar
