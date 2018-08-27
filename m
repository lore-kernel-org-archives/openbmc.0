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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zknF1Dg5zDqSL
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 07:00:48 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7RKwh5B135637
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 17:00:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2m4nrcqe1t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 17:00:45 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 27 Aug 2018 17:00:44 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Aug 2018 17:00:42 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7RL0fAC10748036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Aug 2018 21:00:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9527628058;
 Mon, 27 Aug 2018 16:59:05 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3536828059;
 Mon, 27 Aug 2018 16:59:05 -0400 (EDT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Aug 2018 16:59:05 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: KVM Support?
To: "Tanous, Ed" <ed.tanous@intel.com>, xiuzhi <1450335857@qq.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
Date: Mon, 27 Aug 2018 16:00:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082721-0040-0000-0000-000004660B9A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009622; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01079753; UDB=6.00556902; IPR=6.00859737; 
 MB=3.00022964; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-27 21:00:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082721-0041-0000-0000-0000086D237C
Message-Id: <d046e741-0f9e-16b2-b383-cf0559d56d77@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-27_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808270215
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
X-List-Received-Date: Mon, 27 Aug 2018 21:00:49 -0000



On 08/24/2018 02:04 PM, Tanous, Ed wrote:
>> Well, the VNC server (and Video Engine driver) integration is targeted for the
>> OpenBMC release in February 2019. Hopefully in master before then. There
>> is currently no plan or work being done to integrate a viewer into the BMC
>> webui. But patches are certainly welcome in this area! It could be as simple as
>> dropping in a noVNC html file... not sure.
>>
> Not to disagree with you, but there's some work here:

Yep, sorry, was totally lost in IBM timelines. Definitely some good work 
there.

> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/
>
> The webui side of it was just a matter of dropping novnc into the webui and routing the websocket back to the BMC.  The BMC side of it, implementing appropriate security on the websocket, and some other cleanup is on my back burner.  I'm at a bit of a crossroads, and I have two thoughts on how to proceed.
>
> 1. Rejigger the existing VNC kvm websocket implementation here to update to the new driver API, and delete all the JPEG to bitmap decoding code.  This solution essentially runs a websocket-only VNC server inside bmcweb.https://github.com/openbmc/bmcweb/blob/master/include/web_kvm.hpp
> Pros:
> A. Smaller overall binary size.  Libvncserver supports a lot of things that I suspect openbmc will never need to.  For example, the password authentication mechanisms for VNC/RFB protocol are woefully out of date by modern standards, so I suspect there's no sense in having that code at all.
> B. Better security.  There is no VNC port that could be abused/ported to get access to the KVM session.  The websocket authentication and authorization infrastructure uses the same mechanisms as the rest of the webserver, so it reduces the attack surface.  Said another way, it's unlikely an attack on bmcweb would be able to target the VNC server specifically.
> C. Fewer framebuffer copies compared to a websocket proxy (at least in theory).  It is one fewer trip of the large framebuffers through userspace, which should save us some copies.  At some point in the future if we got the Linux TLS subsystem going, we could likely build a no-copy, or single copy framebuffer solution, which should net us some performance by essentially keeping the buffers in the kernel.
>
> Cons:
> A. It needs to be written.  Hopefully the changes should be mostly deletes, and regiggering to pull framebuffers from the driver.  Keyboard and mouse would need to be hooked up to the gadget driver using the example from obmc-kvm.
> B. It is a specific solution for openbmc, so it's unlikely to have much utility outside of the project.  Contributing to libvncserver "gives back" more to the open source community.
>
> 2. Use bmcweb as a websocket proxy to obmc-kvm server in a very similar way to how we proxy to obmc-console.
> Pros:
> A. Gives us full compatibility with standard socket VNC, which could be useful for debugging purposes.  I wouldn't recommend enabling it in practice without some other kind of authentication and encryption pipeline ahead of it.
> B. The work to do this should be relatively minimal.  It should be essentially a copy-paste of the obmc-console socket code, a little debugging, and it should be mostly good to go.
>
> Cons:
> A. Larger binary size.  I need to get more exact numbers here, but adding a relatively large library (libvncserver) and another application (obmc-kvm) seems unlikely to be good for our flash usage.  As is, we're already pushing the limits of a 32MB flash.
> b. Extra framebuffer copies.  Driver -> obmc-kvm -> bmcweb(with TLS)  -> browser  in theory is at least one extra copy.  It would be interesting to set up both in practice.
> 	
> 3. Some other option that I'm missing?

Well, I created an openbmc/obmc-ikvm repo today and got the source on 
gerrit, as a standalone VNC server that uses libvncserver.

https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/12126/

Wrote all that last week before this thread popped up... certainly open 
to changing directions. After hearing more about image size issues 
lately, option (1) sounds nice...

One possibility would be to extend obmc-ikvm to be able to be built as a 
shared library, and then can link that from bmcweb, possibly with or 
without libvncserver if only the video/input parts are built I suppose. 
Of course it could be built standalone as well for people who want that.

Thanks,
Eddie

>
> I'm very interested in what the community thinks here.  Is there a use case for having the standalone vncserver?
>
> -Ed
>
