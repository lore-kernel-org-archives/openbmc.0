Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKjFb0CDLzDvtf
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 13:52:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kTjpSHQq"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so8693592oie.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9li0ejScPp6yypF0JMGIwFpblcuT0ePe87Zz0jj1iVo=;
 b=kTjpSHQqD5YqoevJpu1Rx8l8PMeaTmVrhnLQCI/2XKJ9SeJah5IY6W5JMGGLqDkR+N
 nLePEyy25rJtj3dYCspD9Vwr+ysvUxSK5AjDGQYdE/b2R7+AVkI+RkPXicmbqCxEi0ix
 bG+HbnEYFq1fBxKz3q7mhciF9rs0mSVrHMxwgXqoi/esOcX4pNf1T7tIm+IgXz5L4IqK
 x2r0hKMcJZXIrKYlja0HU6kUrJNSh1QPsU75artpFqkHF7KHqeFcP/fkjDS/eJKU2YjJ
 RzKU9lMIAXXg4gXiSyTn9LxJu8gI73/+mJXzR2P/pC2wQqGLJH9iKUy+FAMGjbkxcS7/
 oqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9li0ejScPp6yypF0JMGIwFpblcuT0ePe87Zz0jj1iVo=;
 b=jiaYBuVaa0PB1JgVyVkCSvH4h2Sxq/61RV7iPIy/FrioKQJohqSNosKlTnsucx/VTw
 pzCWyh74rsPcBgvlKWLZCWLmJvUmw5Wr8GlVEe66sc3xpGzvW3qk9X0xMSArPzvFQrxL
 xNBjr9GF/vbXympONY+ngWhfcr8USUwRzT2uk1g2aq2dVZVcesb6hOL5QnJw/kwLZNCF
 fEeday+mCFOUNVV8YidWj/uUdG8U+aQme8vBUbKWkN4FKVhbRY/Fa0KoBGRFKkyqEz9G
 em+8Sh/BubaoOavARmMhQ1Epil1BQdgfcXttUoIglswA2ChjaklWzASygHRJAB8HCnEY
 kCtQ==
X-Gm-Message-State: AKaTC01Wxgc+J1fS9+legaDng5dr7ubrehyPy8oH14/tZLt41Hk9m/XeMLpHr3/CTsZLUafiCZwNguIYNNmk6Q==
X-Received: by 10.202.0.205 with SMTP id 196mr3424193oia.44.1479437520505;
 Thu, 17 Nov 2016 18:52:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Thu, 17 Nov 2016 18:51:40 -0800 (PST)
In-Reply-To: <CAPH-5w4+20PFy5F2uMbJHoDoZEZP4ykGdfkkb4iBmPkdP9Oa8Q@mail.gmail.com>
References: <1479338955-5248-1-git-send-email-xow@google.com>
 <1479338955-5248-2-git-send-email-xow@google.com>
 <CACPK8XeWnmGJBYSMrmoE5E0oFJqE9ivp-GG2iCcf7ZDw+qp_ZA@mail.gmail.com>
 <CAPH-5w4+20PFy5F2uMbJHoDoZEZP4ykGdfkkb4iBmPkdP9Oa8Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Nov 2016 13:21:40 +1030
X-Google-Sender-Auth: An57OHkid62_iswhLEATQ6Spofk
Message-ID: <CACPK8Xf4ZpX3577JN7ra-N525z58x79svCdS5Q53HceKqLUPBA@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] ARM: dts: aspeed: zaius: Add I2C master
 selector and hotswap controller
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 02:52:03 -0000

On Fri, Nov 18, 2016 at 8:23 AM, Xo Wang <xow@google.com> wrote:
> Hi Joel,
>
> On Wed, Nov 16, 2016 at 8:59 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Xo,
>>
>> On Thu, Nov 17, 2016 at 9:59 AM, Xo Wang <xow@google.com> wrote:
>>> Add device-tree bindings to instantiate the PCA9541A I2C master
>>> selector. This driver allows mastering downstream devices after sending
>>> an arbitration request to the PCA9541A. Downstream devices go into the
>>> 'i2c-arb' child node.
>>
>> I took a look at the bindings document for i2c-mux[1] and it suggests
>> something different.
>>
>> Is there a reason why you didn't follow what it says?
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-mux.txt
>>
>
> I was following the I2C arbitration bus doc, which has its i2c slave
> device nodes in an "i2c-arb" child node. I'm not sure why it was
> written differently from "i2c-mux" bindings.
>
> To be clear, I haven't 100% tested the LM5066I instantiation since the
> motherboard I have actually has an ADI ADM1272 at address 0x10
> downstream of the NXP PCA9541A.
>
> https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-arb.txt
>

Okay. Thanks for the explanation. I have merged both patches into dev-4.7.

Cheers,

Joel
