Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zcf40Y5tzDrSg
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 02:24:11 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7RGJahR126794
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 12:24:09 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m4kfr3q3g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 12:24:09 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 27 Aug 2018 12:24:08 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Aug 2018 12:24:04 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7RGO4sc46530658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Aug 2018 16:24:04 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 035A628060;
 Mon, 27 Aug 2018 12:22:28 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B3302805C;
 Mon, 27 Aug 2018 12:22:27 -0400 (EDT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Aug 2018 12:22:27 -0400 (EDT)
Subject: Re: KVM Support?
To: "Tanous, Ed" <ed.tanous@intel.com>, "KWLIU@nuvoton.com"
 <KWLIU@nuvoton.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
 <3d92122e8c42452caee0ece1769ee147@NTHCML01A.nuvoton.com>
 <7E9441B1E5EFFD4681F54958E821699345835D1C@ORSMSX114.amr.corp.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 27 Aug 2018 11:24:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835D1C@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082716-0052-0000-0000-00000326AE38
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009621; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01079661; UDB=6.00556846; IPR=6.00859644; 
 MB=3.00022959; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-27 16:24:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082716-0053-0000-0000-00005DDF56C7
Message-Id: <b5c3a139-b2a4-6a35-9ff8-b5b43ade5086@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808270173
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 16:24:12 -0000



On 08/27/2018 10:59 AM, Tanous, Ed wrote:
>> Do you have any plan to support non-jpeg video stream in obmc-iKVM?	
> I'm not sure about Eddie, but I don't think we have  a need for non-jpeg kvm.  With that said, everything is just running RFB underneath, so basically anything should be possible that's possible over VNC.

Right, we also don't have any need for non-jpeg at the moment.

>
>> It is possible some platforms don't have hardware JPEG engine, instead have
>> the RGB video stream.
>> If possible to support RGB video stream, I think it would be better if you can
>> add the video frame differentiation in obmc-iKVM because we don't need to
>> send the full screen to VNC client on every request, it can reduce the buffer
>> size at least. (libvncserver already has the video frame differentiation)
> While I agree it would be nice, I don't think it's a priority 1 for implementation (at least for us).  Our current AST2500 products send full buffer updates for every frame, and while in theory it's less efficient, we haven't really gotten any complaints.  With that said, if differential mode is available and works well, I'm sure we'd use it.

The problem with differential compression is that you have to do that 
decoding work on the BMC so that you update the right part of the 
framebuffer. I didn't get that working but might be some performance 
concerns there... So same for us, it's not a priority right now.

>
>> Also, I have implemented a KVM application for our platform(nuvoton evb-
>> npcm750) which has hardware video frame differentiation and hardware
>> hextile engine.
>> https://github.com/Nuvoton-Israel/obmc-ikvm
>> https://github.com/Nuvoton-
>> Israel/linux/commit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d
>>
> Cool.
>
>> I also enabled ED's KVM webui and added kvmws proxy in python web
>> server.
>> https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-
>> addon/commit/140771b7e898dd5ca8f0364290cce669609088ac
>>
> I've got patches for bmcweb as well that I can get posted today.  I was really hoping to have a discussion around how we want to implement the web portion beforehand, but it looks like you've already done a lot of work, which is great.
>
>> Regarding the larger binary size, I think we need to review all configurations
>> of libvncserver and check which functions should be disabled.
>>
> I think the most important question here is how small of a binary we can get out of libvncserver, and whether or not we can afford to have an unauthenticated socket open with full control of the host system.

All good points. These aspects haven't been a priority for me yet, and 
I'm really not an expert with security or bmcweb, but definitely worth 
some discussion.

Thanks!
Eddie

>
