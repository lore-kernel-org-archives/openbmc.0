Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::234; helo=mail-oi0-x234.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNK2pcfq"; 
 dkim-atps=neutral
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QFnP1Q0vzDr2p
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 07:33:44 +1000 (AEST)
Received: by mail-oi0-x234.google.com with SMTP id r16-v6so45519393oie.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=X2zpXUecWzeWsiB7ZUIuuNAOC0MA5AGkQ4b6hyDJFog=;
 b=gNK2pcfqQjFSlTgJJOdSH2a1WLkCJrV3ZlhI07GVDXMX8Sen6/cWuaN58CVu8ZPC//
 o2WkioE59fXDTaFx9bigQB1bZ4h0gyvbWz/GKNwX2w8SLqm8txparnL//0ELZf67bV7x
 thhtejRtFmUjXZX6R2zB1MBrkzR9gGMfZ40z5wF2J6vhBTpdntaspZb4eSX8lkKef12k
 lkvJD7Mdidzqb3rBid1VbGFJrtXqPYcSPz2abLF82YTkszqY/FXgAX6k4gpNtUQxAfaA
 e+AKE5JIdK7S2NkmChDwgiNFXFrqxzlSqPoMadD7zz8Gx31BVPdPoHisrVKHBtzkwNSB
 nSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=X2zpXUecWzeWsiB7ZUIuuNAOC0MA5AGkQ4b6hyDJFog=;
 b=NsRQDZqr3BMP3AnBfiEDqzqM4BIkH4dNRHUdYMq1vIgr78bGXrCCjpor6gUmVM6RUx
 lh7vEZIMismq+EBEYtTxCEHay/ztyuVqpj15Er0sLAT8xblr8IOsd1E1Vl+3+QgZUdY4
 TUQPqeqO+NlIzk4wmqOsLbI5q0WL0xLZmPYNEjQVMAdLjW/miJN82zCUJRRQjG/Ptqym
 J9BsNrVCyEjOLLNewydFmc9cK0Z3S7+6Sb86+EbQXmDHUTcx2Xn+L6N2mZbV4Dozj7TJ
 5jZLEAsz3COOBKGzvfeiEmS8Q/UBqPPPnK3xJxLX5mJk/64dclbw5Qrm/w/ArUmj14yy
 NwFw==
X-Gm-Message-State: APt69E1eMP+RHzeVh/7Yl6stlzYLEQ3ckGIiyon2lxVkXAvF5rKbepyz
 Tv3ZUWZqkf1NCDy2aM5eL4kMwyff
X-Google-Smtp-Source: AAOMgpdJ6QEdFHx0vRVnDVPQdRJt6Y7LVHXOm6hx/kImUjOd7nLdRJ7acSL/Zs2fUSJFlfgRl2YE0g==
X-Received: by 2002:aca:cf43:: with SMTP id
 f64-v6mr31220880oig.113.1531258422185; 
 Tue, 10 Jul 2018 14:33:42 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id u13-v6sm11041710oiv.18.2018.07.10.14.33.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Jul 2018 14:33:41 -0700 (PDT)
Subject: Re: gerrit server update coming - 2.15.2
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b562920a-329f-d5c4-28af-555e4bb3bc33@gmail.com>
Date: Tue, 10 Jul 2018 16:33:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------3897B126B5D998821737B2B8"
Content-Language: en-US
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
X-List-Received-Date: Tue, 10 Jul 2018 21:33:46 -0000

This is a multi-part message in MIME format.
--------------3897B126B5D998821737B2B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/18 3:13 PM, Andrew Geissler wrote:

> I'm planning a gerrit update in the near future (this Saturday
> maybe?).  Anyone have any issues with an update (or know of any issues
> with the 2.15 release)?
OpenStack is still on 2.13.9+ (we're at 2.14.7), is there a problem we 
need fixed? No issues, just curious.

Kurt Taylor (krtaylor)

--------------3897B126B5D998821737B2B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 7/10/18 3:13 PM, Andrew Geissler wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com">
      <pre wrap="">I'm planning a gerrit update in the near future (this Saturday
maybe?).  Anyone have any issues with an update (or know of any issues
with the 2.15 release)?</pre>
    </blockquote>
    OpenStack is still on <span class="gwt-InlineHTML">2.13.9+ (we're
      at 2.14.7), is there a problem we need fixed? No issues, just
      curious.</span><br>
    <br>
    Kurt Taylor (krtaylor)<br>
  </body>
</html>

--------------3897B126B5D998821737B2B8--
