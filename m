Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43GgLR0y23zDrJB;
 Sat, 15 Dec 2018 06:18:06 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Dec 2018 11:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,354,1539673200"; d="scan'208";a="110454612"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2018 11:18:03 -0800
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: Add sensors devices for Facebook
To: Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20181213195319.1333402-1-vijaykhemka@fb.com>
 <CACPK8XfAXDHqWcD=OKm4UhCh-+-7GBxL02Fi9_jgdmo2ZQZSjg@mail.gmail.com>
 <B6C3C92D-1F9E-4425-ABF5-718D1A6755EB@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c1e35845-cb07-048f-bcf7-d7239a387027@linux.intel.com>
Date: Fri, 14 Dec 2018 11:18:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <B6C3C92D-1F9E-4425-ABF5-718D1A6755EB@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 14 Dec 2018 19:18:08 -0000

Hi Vijay,

On 12/14/2018 10:11 AM, Vijay Khemka wrote:
> On 12/13/18, 2:56 PM, "Joel Stanley" <joel@jms.id.au> wrote:

<snip>

>      > +               oemname0 = "MB_P3V3";
>      > +               oemname1 = "MB_P5V";
>      > +               oemname2 = "MB_P12V";
>      > +               oemname3 = "MB_P1V05";
>      > +               oemname4 = "MB_PVNN_PCH_STBY";
>      > +               oemname5 = "MB_P3V3_STBY";
>      > +               oemname6 = "MB_P5V_STBY";
>      
>      "oemname" isn't part of the upstream bindings. Is this something you
>      have patches for?
> This is a workaround field used by dbus-sensors application to avoid overlay for dynamic detection of devices based on json file definition.
> 
> Can you please also review other 3 patches in this series.
>      
> 

These oemname settings should not be added into here. You can add these
information into configuration of entity manager which uses overlay
templates for dbus-sensors. Also, as Joel said, "oemname" isn't part of
the upstream bindings.

Cheers,
Jae
