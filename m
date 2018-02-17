Return-Path: <Luis.A.Silva@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=luis.a.silva@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="jxwNR1Q2"; 
 dkim-atps=neutral
X-Greylist: delayed 642 seconds by postgrey-1.36 at bilbo;
 Sat, 17 Feb 2018 12:23:09 AEDT
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjshY1C6KzF1XL
 for <openbmc@lists.ozlabs.org>; Sat, 17 Feb 2018 12:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518830589; x=1550366589;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=NE/+R+sOk3xSQzYA7qrRm/1uPXn7NH2lSQmUoTYKL6I=;
 b=jxwNR1Q2bNXBOOpaDmCipX8EBjwLD1/Y5uSbrEFh84E0b6Kra6zuvbUP
 TIKcf9VOTBBVGLdWiccaH3hkRT0+Zoy2coRkSvpq5tmizBB7uiP+7LqRH
 6nhSimOPkU0s6ueQLPgfmMSURXEnOhZSO3sUerN54pb3yCeCaLX3wuKIR s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GFAgAlgYdah2Ka6ERbGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYVNCoNKmCuCAoEXmF8KhTsCgkZYFAECAQEBAQEBAgECEAEBAQoLCQg?=
 =?us-ascii?q?oL4I4IoJLAQUjDwFWCxgCAiYCAkcQBg0GAgEBFooHrU2CJ4UBg32CEwwmCQGBB?=
 =?us-ascii?q?YN4giiBWIIQgwWFb4JLgmUFk2iQTQMGApYIggcZhiqLfZAFiBqBPDaBdHBPgkO?=
 =?us-ascii?q?CVBAMgidXjSGBGQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GFAgAlgYdah2Ka6ERbGgEBAQEBAgEBAQEIAQEBAYVNCoN?=
 =?us-ascii?q?KmCuCAoEXmF8KhTsCgkZYFAECAQEBAQEBAgECEAEBAQoLCQgoL4I4IoJLAQUjD?=
 =?us-ascii?q?wFWCxgCAiYCAkcQBg0GAgEBFooHrU2CJ4UBg32CEwwmCQGBBYN4giiBWIIQgwW?=
 =?us-ascii?q?Fb4JLgmUFk2iQTQMGApYIggcZhiqLfZAFiBqBPDaBdHBPgkOCVBAMgidXjSGBG?=
 =?us-ascii?q?QEBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Feb 2018 19:12:21 -0600
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2018 07:12:20 +0600
X-LoopCount0: from 10.166.136.212
X-IronPort-AV: E=Sophos;i="5.46,522,1511848800"; d="scan'208";a="618943934"
X-DLP: DLP_GlobalPCIDSS
Subject: Re: OpenBMC v2.1
To: <openbmc@lists.ozlabs.org>
References: <85D445A6-8BEF-40A0-BD8A-5102D74129C9@fuzziesquirrel.com>
 <d8f209c0e9e749fdbc241afb81cb6228@AUSX13MPC101.AMER.DELL.COM>
 <7854C6B6-55EE-4499-BE8A-756E57B16E8C@fuzziesquirrel.com>
From: "Silva, Luis" <luis.a.silva@dell.com>
Message-ID: <10354d99-b25a-ca1c-555d-9a36d4953bc4@dell.com>
Date: Fri, 16 Feb 2018 17:12:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7854C6B6-55EE-4499-BE8A-756E57B16E8C@fuzziesquirrel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.232.111]
X-ClientProxiedBy: ausx13mps340.AMER.DELL.COM (10.166.136.217) To
 ausx13mps335.AMER.DELL.COM (10.166.136.212)
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
X-List-Received-Date: Sat, 17 Feb 2018 01:23:10 -0000


On 1/29/2018 8:50 AM, Brad Bishop wrote:
> 
>> On Jan 26, 2018, at 11:10 AM, <Prashanth.Giri@dell.com> <Prashanth.Giri@dell.com> wrote:
>>
>> Concur with the idea of moving to more yocto aligned branch strategy. Would like to be part of the discussions around how/when etc.
> 
> Great!
> 
>> aspects of the move. Did we start any already ?
> 
> No.  Please watch the list for discussion.  If you have any ideas I’d love
> to hear about them.
> 
> -brad
> 

Hello Brad et all,

Any news on OpenBMC v2.1? I am wondering if switching to Linux dev-4.13
is in its scope ...

Thanks,

Silva.
