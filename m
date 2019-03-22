Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QnSQ3k4MzDqVQ
 for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2019 02:21:42 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MFEK2D096015
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 11:21:40 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rd19638db-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 11:21:39 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Fri, 22 Mar 2019 15:21:35 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Mar 2019 15:21:31 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2MFLXba19005652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Mar 2019 15:21:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CE8312405C;
 Fri, 22 Mar 2019 15:21:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9E36124054;
 Fri, 22 Mar 2019 15:21:32 +0000 (GMT)
Received: from [9.85.226.87] (unknown [9.85.226.87])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 22 Mar 2019 15:21:32 +0000 (GMT)
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Lei YU <mine260309@gmail.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>,
 Thaju <tajudheenk@gmail.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
 <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
 <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
 <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
 <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
 <CAARXrtnAURfEDzTHZLHgOojRuD9T4DbUmuQLwvwsS4hvW-Sk_Q@mail.gmail.com>
 <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
 <CAARXrtnPYfxVUdkja+LyzHPvrvQr0124KNoJva8_nuLKKeeN+g@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Fri, 22 Mar 2019 10:21:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtnPYfxVUdkja+LyzHPvrvQr0124KNoJva8_nuLKKeeN+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19032215-0064-0000-0000-000003BEB3FA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010795; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000282; SDB=6.01178074; UDB=6.00616327; IPR=6.00958772; 
 MB=3.00026111; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-22 15:21:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032215-0065-0000-0000-00003CCDDA19
Message-Id: <9c0500f5-fb43-660a-6db6-71cf919ce3ae@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903220112
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
X-List-Received-Date: Fri, 22 Mar 2019 15:21:43 -0000


On 3/21/19 10:34 PM, Lei YU wrote:
>> Are you using a web browser from Windows OS? It seems that there is an
>> issue of Windows websockify/novnc. Use a browser from OS other than
>> Windows til the issue is resolved.
> It's Ubuntu 18.04's Firefox and Chrome.
>
>> Did you test it using Tight VNC viewer after enabling external
>> connection? The reason why I suggested that is to identify whether
>> this issue comes from KVM web proxy or from KVM server.
> Yes, TightVNC behaves the same as the KVM in browser.
>
>> Need more information of your test environment.
>> Server platform:
>> BMC SoC:
>> Host OS:
> Server platform: OpenPOWER Romulus
> BMC SoC: AST2500 with OpenBMC master + patches needed for KVM
> Host OS: Ubuntu 18.04 server
>
> There is an update from my testing:
> 1. If the host is in Peitiboot (this is an OpenPOWER's thing), or in OS
>     without X, KVM sometimes works, sometimes does not work, as the log shown
>     above;

I have seen this too; I think it's a VGA or VGA driver problem more than 
KVM. Not sure we will be able to find a fix.

Thanks,

Eddie

> 2. If the host is in OS with X (e.g. lightdm), then KVM always works well.
>
