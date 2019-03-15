Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44LXDs5Sm1zDqVk
 for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2019 04:11:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Mar 2019 10:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,482,1544515200"; d="scan'208";a="283019160"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga004.jf.intel.com with ESMTP; 15 Mar 2019 10:11:53 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
Date: Fri, 15 Mar 2019 10:11:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <tencent_77BC148C0E378EFD5F488CE6@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 15 Mar 2019 17:11:58 -0000

Hi Xiuzhi,

openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68

I'm using a custom build config for my machine. As you already know, for
enabling the KVM feature, customization on kernel configs, adding a
'start-ipkvm' service, adding of libvncserver package and back-porting
of aspeed video driver are also needed so there is no one-shot buildable
TEMPLATECONF for KVM test.

Cheers,
Jae

On 3/15/2019 12:18 AM, xiuzhi wrote:
> Hi Jae,
>     Thanks for giving me the source  commit numbers related to the  ikvm 
> feature  .
> But It didn't work after I updated them.
>   Would you like to tell me your github.com/openbmc/openbmc commit 
> number and the target machine of  TEMPLATCONF?
> Best,
> Xiuzhi
> 
> Hi xiuzhi,
> 
> These are my repo information:
> bmcweb: 9474b3788017bddd70e493e2b9b7674be30abc87
> phosphor-webui: 511a2bbc5540fccb883b8d0005c2b387a23c9d05
>                   Cherry picked
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/
> libvncserver: 3348a7e42e86dfb98dd7458ad29def476cf6096f
> obmc-ikvm: 2bc661d34abd1fda92a9d2b256ed88ca0e90d09a
> 
> I can see working KVM through https://my.bmc.ip.addr/#/server-control/kvm
> 
> -Jae
> 
> On 3/13/2019 7:21 PM, xiuzhi wrote:
>  > Hi Jae, Ed,
>  >      I updated the source to openbmc latest version which uses bmcweb
>  > instead of phosphor-rest.
>  >     It seemed that ikvm cannot work on bmcweb.
>  > The websit error:
>  > app.bundle.js:43 Refused to connect to 'wss://192.168.200.132/kvm/0'
>  > because it violates the following Content Security Policy directive:
>  > "default-src 'self'". Note that 'connect-src' was not explicitly set, so
>  > 'default-src' is used as a fallback.
>  > Then I modify the bmcweb file include/security_headers_middleware.hpp 
> L40:
>  >          // The KVM currently needs to load images from base64 encoded
>  > strings.
>  >          // img-src 'self' data: is used to allow that.
>  >          //
>  > 
> https://stackoverflow.com/questions/18447970/content-security-policy-data-not-working-for-base64-images-in-chrome-28
>  >          res.addHeader("Content-Security-Policy",
>  >                        "default-src 'self'; img-src 'self' data:");
>  > to:
>  > policy-data-not-working-for-base64-images-in-chrome-28
>  >          res.addHeader("Content-Security-Policy",
>  >                        "script-src 'self'; img-src 'self' data:");
>  >
>  > The website erro:
>  > "app.bundle.js:43 WebSocket on-error event"
>  > "WebSocket connection to 'wss://192.168.200.132/kvmws' failed: WebSocket
>  > opening handshake timed out"
>  >    What is wrong with it?
>  >     Best,
>  > Xiuzhi
>  >
