Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHc5n0KfNzF0fT
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 06:54:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 11:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,346,1511856000"; d="scan'208";a="10539181"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2018 11:54:16 -0800
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
To: benh@au1.ibm.com, Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com> <1515661011.31850.27.camel@au1.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <566dd4c4-3b94-fc06-f3d1-2fe84b639e81@linux.intel.com>
Date: Thu, 11 Jan 2018 11:54:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515661011.31850.27.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 11 Jan 2018 19:54:21 -0000

On 1/11/2018 12:56 AM, Benjamin Herrenschmidt wrote:
> On Thu, 2018-01-11 at 08:30 +0100, Greg KH wrote:
>> 4.13?  Why that kernel?  It too is obsolete and insecure and
>> unsupported.
> 
> Haha, it's n-1. come on :-)
> 
> 
>> What keeps you all from just always tracking the latest tree from Linus?
>> What is in your tree that is not upstream that requires you to have a
>> kernel tree at all?
> 
> There are a couple of ARM based SoC families for which we are in the
> process of rewriting all the driver in upstreamable form. This takes
> time.
> 
> To respond to your other email about the USB CDC, it's mine, I haven't
> resubmited it yet because it had a dependency on some the aspeed clk
> driver to function properly (so is unusable without it) and it took 2
> kernel versions to get that clk stuff upstream for a number of reasons.
> 
> So it's all getting upstream and eventually there will be (we hope) no
> "OpenBMC" kernel, it's just a way for us to get functional code with
> non-upstream-quality (read: vendor) drivers until we are one rewriting
> & upstreaming them all.
> 
>> And if you do have out-of-tree code, why not use a process that makes it
>> trivial to update the base kernel version so that you can keep up to
>> date very easily?  (hint, just using 'git' is not a good way to do
>> this...)
> 
> Joel and I both find git perfectly fine for that. I've not touched
> quilt in eons and frankly don't regret it ;-)
> 
> That said, Jae should definitely submit a driver against upstream, not
> against some random OpenBMC tree.
> 
> Jae, for example when I submitted the original USB stuff back then, I
> did it from a local upstream based branch (with just a few hacks to
> work around the lack of the clk stuff).
> 
> I will rebase it in the next few days to upstream merged with Stephen's
> clk tree to get the finally merged clk stuff, verify it works, and
> submit patches against upstream.
> 
> There should be no mention of dev-4.10 or 4.13 on lkml or other
> upstream submission lists. Development work should happen upstream
> *first* and eventually be backported to our older kernels while they
> exist (hopefully I prefer if we are more aggressive at forward porting
> the crappy drivers so we can keep our tree more up to date but that's a
> different discussion).
> 
> Cheers,
> Ben.
> 

Thanks for your reminding me the upstream process. I'll do like you said 
afterwards.

Thanks,
Jae

>> thanks,
>>
>> greg k-h
> 
