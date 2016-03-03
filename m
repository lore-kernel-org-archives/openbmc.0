Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EADAF1A0342
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 19:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=PmbZ4tTP; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id k196so14624728vka.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2016 00:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Gx42Dfhm+oIyo4UySq4TNXzS3HT3I4iQntRbDB4f3wE=;
 b=PmbZ4tTPBus+RMewiFfN5Zo5A2G0xDWKeqgDQ44puvZep1LaAiDbGdpK1KNKpYvE5J
 bw3IykATpUzAqUboLD0Znn9gu/6TJ49n2EZZhRDoD3nPvjtdCTAdB7lgiyOIAr53TbaE
 +2mFS4PV7TjS+FL98CWlOA6ISJgnQoUSXvqnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Gx42Dfhm+oIyo4UySq4TNXzS3HT3I4iQntRbDB4f3wE=;
 b=aOzlWgdV5L+eYNYdRI814f7ic9cYAutZafOznO0pNNq31rPKGc0DNMLF0pfs3fR4nV
 8u7+FK3PvwGF19OgYISm+QjpYIUXP3Kmo3LE2JpmanCp+cM1GHwxv/6xy7xto5vl0hKl
 esBF5RYTUP9YdpkQs/L5xN3Bo2a5OhUNfBEDM/U9QKVZfn+aYduVBVYesK02H0ATa87K
 g7ltOCFT9vl9pwcH8rDh76gb0qnsrxRFOTkuvoU3dna/PwdQ8hH+c9EqKT4YHF8zAQQR
 kNbiZGJYU0oR5Rvia8g/CY3Q8NwxQX02alQVq45S8VvgNtBLU64upAFEtYofzLMdwDx2
 qLDg==
X-Gm-Message-State: AD7BkJLJgMwqR7mbYZENTYqMiSepDN/Z92RAQkezf8mUPXzZH95tqhHXsasaZbi3tzQulyAwzHFzTr8/c2HqyZFJ
X-Received: by 10.31.8.210 with SMTP id 201mr1028212vki.90.1456994377100; Thu,
 03 Mar 2016 00:39:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 00:39:17 -0800 (PST)
In-Reply-To: <1456982069.10265.11.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
 <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
 <1456982069.10265.11.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 08:39:17 +0000
Message-ID: <CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400 AVIC
 device model
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org, 
 qemu-arm <qemu-arm@nongnu.org>
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
X-List-Received-Date: Thu, 03 Mar 2016 08:39:40 -0000

On 3 March 2016 at 05:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
>> > +    case 0x20: /* Interrupt Enable */
>> > +        s->int_enable |= data;
>>
>> Are you sure this only ORs in new 1 bits?
>
> As in, am I sure I only want to take the newly set bits? If so, yes, as
> the the following register serves to clear the field's set bits:
>
>>
>> > +        break;
>> > +    case 0x28: /* Interrupt Enable Clear */
>> > +        s->int_enable &= ~data;
>> > +        break;
>
> The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
> ttern of separate set and clear registers (the remaining registers may
> benefit from the extract64/deposit64 helpers, I'll think about that
> further). I'll add some comments to help clear this up.
>
> Otherwise, can you rephrase the question? At face value it seems like
> you're implying that I'm doing more than ORing in the new 1 bits?

It was just that the register name didn't imply a set-bits-only
semantic and some of the other registers looked like they were
also incorrectly not handling updates right.

thanks
-- PMM
