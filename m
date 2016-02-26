Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C5F641A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 17:40:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uNJ8GsbG; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Bc9r9mX/; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i14so3840894oig.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=HmzPSePch8CT8VGJN0s8hR7VZJT6wA7AKBE08+H6bn8=;
 b=uNJ8GsbGxfLgJZa5+aLqerGgS+2RL992FjX+kgc9rZz5LZ/AKK7BWnw6jYi0HJ2Tzx
 LmrbVP16/GE4+3M2ZMJD75kaW25xnlYacfWtorBg8wZEM5H8rY1KJOfb0a/i96+VS6cv
 FIWDdmjSmBJf+7NXsKV3+aNoamaFKThFROiMp35KvhVfH8QjMqPEUpfCYXH5VJq6RBPX
 g9DR1HX9/X0UPKsfYUZsXsXTk8rWs+GXpFI+MOPYgxVdwpWSf0+3LmyswTmj4HCCl/lC
 E7e50PJl3di6tv2z0+9WKjhpgxqR85F0c1NGZYxAj2ftgP8sueW2pkt99FHJHcyfwsJv
 9nTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=HmzPSePch8CT8VGJN0s8hR7VZJT6wA7AKBE08+H6bn8=;
 b=Bc9r9mX/flIJG9LI5z3MFV4sKLW3vdOJmgPfh7hNuo9P5QQiheHbhPg2BXXAvmPK53
 fViRBvS/aKCThc2KttQrmwdMW7j8QpQcFfDle8ohZODm2MZixJuuBOGiNP8Ggf9TzmmR
 h64gKl5BS9HTcCJPJTwBfjX2HcVF5C0EIA9/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=HmzPSePch8CT8VGJN0s8hR7VZJT6wA7AKBE08+H6bn8=;
 b=IDsqK8JN0UzbqSvnf5+jdtOMc7trfpUmUUPI5EVv4C2kA52JNOeLNvfb9GUUFJT86X
 WqJxSCwJSBgd5LlUsCJaVJlqxWrg5v7uE5cAsEKqY0tTP8LQnsxroT2kYqui93qYMEdb
 yiLxLVj3PFobjFpC4wRfAkazj0dtZWCMg2q52uQFcE6aHKHBd+WLl6uxLmiUERogX7WL
 w/m715qXy59AR+a6999fXX1P51jBD9DISYo7qO9C+NQHV2Oan8B7jFgQ8LDDI875rssm
 +hHSpZ9XVEwNiZbnhjzP1s5b8tQ0bQoIkJc5BS2mWU8ZyzA/0Nj+MEyauPABLDn820PN
 GSBw==
X-Gm-Message-State: AD7BkJKYqn3Wpm8UDolhou/GqsRdsCwF3t7i9P50w9VqNbfb6kRRrkUN41FhG1x2nXbNsr6Pnd/CUZh9PPnGZw==
X-Received: by 10.202.54.70 with SMTP id d67mr761781oia.110.1456468800122;
 Thu, 25 Feb 2016 22:40:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Thu, 25 Feb 2016 22:39:40 -0800 (PST)
In-Reply-To: <20160226163612.4491a525@camb691>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
 <20160226163612.4491a525@camb691>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 26 Feb 2016 17:09:40 +1030
X-Google-Sender-Auth: c2YV7CXfh5KcoYWiVHnxx2ptnmA
Message-ID: <CACPK8XcNM2j-ehHWC9mF_HXLUeuqc4M2HZxE_=ZXy1OMoEAyfA@mail.gmail.com>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 26 Feb 2016 06:40:05 -0000

On Fri, Feb 26, 2016 at 4:06 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> In completely unrelated news is there a way we can fix that pressing reply to
> all doesn't send any notification to the author of the patch...

The best way to fix that is to use git-send-email to send patches to the list.

Cheers,

Joel
