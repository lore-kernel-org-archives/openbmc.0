Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EBF511A0B4C
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 23:41:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=WKHzPT7e; 
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id k196so200900689vka.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2016 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2++iNLz2Yt5d9ldr5ZWug2jPugIFv3vRS0GjFoNqAZI=;
 b=WKHzPT7eYZtkCmd8J85xfBN1pf5K6NsY7KbBb6/s8blgJlwNmRHXKUXSczqh7wSLZE
 XHoybKFOmpd214jcx4KNJLiEN1jqglVKYE2/rdFk+BrmN5OSjpto5FjJtMFfxyQjyjFi
 wQHwadgh8MFh9iOxZxcKyOpInEjM4E5lD/guI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2++iNLz2Yt5d9ldr5ZWug2jPugIFv3vRS0GjFoNqAZI=;
 b=mH0YIVqbWtbURJi+0iek/EedTZyCwnC604qLLZSMValdPfJ66afnKWCAN8qq/wPkyV
 iwRvIF7IXbo+z0T7OyLOP2H1SlVP3PrkC9aYGpMue5ukiWZYbMD5LsJZewl0KO/FUXYJ
 h8/ibgGppQKICw18YWtu1pC1U6BSPdUSrzJnB9NRSpLUStaTLV4O9z8RobL3S6Ty0CyJ
 svvoJOj1TlGNehCknlsxIMph8THIh5bSZnysMa2lC9hrvFWfEQlQ3/HTt7ATlpmdWJZi
 OtmaiuOC4B7Kbtk2Ohi9+IiF2x1LzHnCjcgR/jRoJPDMeUeW36RJu7pHHO3s1l4ZTujU
 BBsw==
X-Gm-Message-State: AD7BkJL+ZRkzKdm74ybyZoG2u+u5eui9nF/AzVvvvFzFOAiVhuPbI6HgxhWe+H1oHRESFFBKzx1GJi1hTloU1SWo
X-Received: by 10.31.141.2 with SMTP id p2mr20240969vkd.37.1456922479435; Wed,
 02 Mar 2016 04:41:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 2 Mar 2016 04:41:00 -0800 (PST)
In-Reply-To: <1456880983.32556.41.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
 <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
 <1456880983.32556.41.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2016 12:41:00 +0000
Message-ID: <CAFEAcA8g8D1+2c7H1_ciUCg2doxmfxN3jH-k+iidC3JPCQ2QWQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400 AVIC
 device model
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 12:41:24 -0000

On 2 March 2016 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Peter,
>
> On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
>> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > +#define AVIC_L_MASK 0xFFFFFFFF
>>
>> This needs a 'U' suffix or at least one of the compilers we build
>> with will complain.
>
> Okay. Out of interest, what compiler will complain?

Ancient gcc 4.2. (Actually I've now dropped that from the testing
set, but I still tend to recommend U suffixes in review.)

thanks
-- PMM
