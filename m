Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9k050Sz3zDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 01:58:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v99EvPv9125756
 for <openbmc@lists.ozlabs.org>; Mon, 9 Oct 2017 10:58:43 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dg5x0kber-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 10:58:42 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 9 Oct 2017 10:58:41 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 9 Oct 2017 10:58:39 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v99EwdP449086594; Mon, 9 Oct 2017 14:58:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70571112034;
 Mon,  9 Oct 2017 10:58:14 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D816D112051;
 Mon,  9 Oct 2017 10:58:13 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v4 28/31] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
 <9D069C32-9D7D-4D20-938A-AB9FF92E4ABC@fuzziesquirrel.com>
 <CACPK8XdFDN8VdidYsKKqhO5AKzgPBER-R6UHhF_VhqL_zyNTRw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 9 Oct 2017 09:58:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdFDN8VdidYsKKqhO5AKzgPBER-R6UHhF_VhqL_zyNTRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100914-0044-0000-0000-0000039CC26A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007867; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00928669; UDB=6.00467380; IPR=6.00708941; 
 BA=6.00005630; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017458; XFM=3.00000015;
 UTC=2017-10-09 14:58:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100914-0045-0000-0000-000007CBD572
Message-Id: <800a5c54-e899-843e-f654-b768fd2af337@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710090218
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 14:58:45 -0000



On 10/08/2017 08:53 PM, Joel Stanley wrote:
> On Mon, Oct 9, 2017 at 10:35 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>> On Oct 5, 2017, at 10:05 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
>>> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
>>> {
>>>        int empty;
>>>        struct occ_client *client = to_client(xfr);
>>>        struct occ *occ = client->occ;
>>>
>>> +     if (occ->cancel)
>>> +             return -ECANCELED;
>> Can we have ENODEV here?  That seems to be typical for this scenario and
>> ECANCELED seems to be for canceled AIO operations.
> I agree.
>
> Eddie, I will fold this change in when I merge if you're okay with it?

Sounds good! Thanks
Eddie

>
> Cheers,
>
> Joel
>
