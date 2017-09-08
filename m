Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22d; helo=mail-lf0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUvQsEZT"; 
 dkim-atps=neutral
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com
 [IPv6:2a00:1450:4010:c07::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpRMN3GvLzDrVj
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 15:53:35 +1000 (AEST)
Received: by mail-lf0-x22d.google.com with SMTP id c80so3393104lfh.0
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=f5YaPQT+TAW7p22vO4HnU3s8e9m37AX02RMYzEmkNig=;
 b=SUvQsEZT4FdsOOKzdbzXc5Ti55q7qT/iani2alVzI2duRN3F7Jc+UTmMi40Z/obzKr
 hG6xf2n2FNSyWJlzZ4N3V2XdBGwhszteNnaOfv5qv9DCnDajxn5gfQbgdvy5N2BJo7Lv
 0giSetYiwcZEwSe55PaeUCMiDe3KsZGCt2iF8nDUtSL/GqKZpg0uAm2S5/YESglqV5Su
 sSTIUVV4FH/t3qn2yYqBPuNw8n2wDgjc5RSS/dir7zcr/CPeWrj9VFgFHYMzGjfnc4Wz
 vnGBWflUdXe0PjRLqW0Bjn8vaVNGKpDl0SqSk7gy9Qzvlq/1kDfcbYCxXNDUYovcrHPL
 WwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=f5YaPQT+TAW7p22vO4HnU3s8e9m37AX02RMYzEmkNig=;
 b=f5iK4yndNlpO942HvwWTZhvyKcrJjyLTVMfBSJ55UjNtK3ZG3TmT4Mfb/m3mrH3EFV
 vvRCmVJGdJaGiVi79CNr8B7Mz8DlVNNiJyUdvAHt7ewA4jp652fXzJtPy4g7zannBNjd
 MHc17gvHDh8r7/i2HhIxtOd7my54G7WK1lYWrbzvh1M+eHvuq1Ocsxhquss2zRsmg3Ew
 9pjhv5J5Dn2OozezXvzq/7blD7PdecezE1/Cf1jr4kTclw8QQEuAJC2jgjhA0703bEpT
 LY8147m1wyKSSmh8NxxXvCN3js2Youdi6hJrNLHFRv/BqXVX1dF6kcfYz4FWltESeqKR
 /gvg==
X-Gm-Message-State: AHPjjUg3wD3Ko6SijCP4GghqqKncUj7ThgJLF40+R+DROcRZK1uihuNJ
 nOnNvbzDeiXwS9PYYjRj4I4djioabg==
X-Google-Smtp-Source: AOwi7QAEvJGdgIQ5vcRpUSlVWzc2+9vrOzhEQfVQQYqOTB03hUwGmSj4g67LMIpUaVXUtlji+xRuMqHv0nm000gyEyM=
X-Received: by 10.25.209.80 with SMTP id i77mr581182lfg.257.1504850012411;
 Thu, 07 Sep 2017 22:53:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Thu, 7 Sep 2017 22:53:11 -0700 (PDT)
In-Reply-To: <f07313a1-c609-f760-9578-4d6889fd89d9@kaod.org>
References: <20170901053858.10070-1-andrew@aj.id.au>
 <f07313a1-c609-f760-9578-4d6889fd89d9@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Sep 2017 15:23:11 +0930
X-Google-Sender-Auth: fX6ZxQ310f9mVfFOvzF13vPf8Xo
Message-ID: <CACPK8XeoZknwJ8VqSgvbzgWVBgCxiB2GB6n--LXEUVDodND6DQ@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pca955x: Don't invert requested value in
 pca955x_gpio_set_value()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rpurdie@rpsys.net, 
 jacek.anaszewski@gmail.com, pavel@ucw.cz, Brandon Wyman <bjwyman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 08 Sep 2017 05:53:37 -0000

On Sat, Sep 2, 2017 at 2:36 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 09/01/2017 07:38 AM, Andrew Jeffery wrote:

>> Rework leds-pca955x so that we avoid the incorrect inversion and clarify
>> the semantics with respect to GPIO.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

I gave this a spin on our 'witherspoon' system and the LEDs responded
as expected.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
