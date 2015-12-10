Return-Path: <joel.stan@gmail.com>
Received: from mail-ig0-x230.google.com (mail-ig0-x230.google.com
 [IPv6:2607:f8b0:4001:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 339B61A087B
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 12:03:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cP8wUmIw; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=BZJQL9cb; 
 dkim-atps=neutral
Received: by mail-ig0-x230.google.com with SMTP id mv3so5578660igc.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2015 17:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=OlEcTkWd9+VufcTWctkNaTAuQF/Yo7mbrw7xbut6K6E=;
 b=cP8wUmIwpssWf9CLmG8n7B4ZPhO/PWQ4Fa380Zw4SQaQ6Rxyc9gpL5hq3VxkvX7+JU
 Ty3dvlRrkjSz5K78e4qRkrD63ZTmwFfRDGdoCyjs0oqpMaIK7ILvTS7+ea9aYOYYS3X2
 H88F03Eucx7T/TCMt6+BD4Lk4JYxw96S1CHHhr8+f08YCsq1Ur8uAw+6ifisvDDbQFyk
 VtdwQi/ipe1fBpVCsTmCg2O3ROc65Qj7XyZPRtihqajBYDtNzv3aBqYaaWnY6rilVkrR
 n/kCqBZASgqU5XoQozSGFcpsIGe218/hmyTMsubysZpHwBy1pxBlmrPw25z/Eh1GczI6
 X9BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=OlEcTkWd9+VufcTWctkNaTAuQF/Yo7mbrw7xbut6K6E=;
 b=BZJQL9cbPU5yNx/2IHxPpe5SaPRvSyyxY4FfoUhtfqOMndwHDhFIIxB7QIEK2SOUaN
 tLGDElma4wpO+SRfg9F2m5Ao0r8mrSbzwCRU1FJU/vGz8OJPEbWgEEAv5mrwjvdbrl6e
 7rR1A7D5h9ck9EDR7MtGY+5eJDMEEiFvTSilY=
X-Received: by 10.50.79.202 with SMTP id l10mr32708007igx.46.1449709422810;
 Wed, 09 Dec 2015 17:03:42 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.79.29.201 with HTTP; Wed, 9 Dec 2015 17:03:23 -0800 (PST)
In-Reply-To: <1449641406-15479-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449641406-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449641406-15479-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Dec 2015 11:33:23 +1030
X-Google-Sender-Auth: ROPF8XnU93iG_UQc5APvgizk5XA
Message-ID: <CACPK8Xfx+hqgaSkR8Ad-O4Rm8jdxYtzfvoUOfdmB4XgcZmse1Q@mail.gmail.com>
Subject: Re: [PATCH btbridge v2 1/3] Update usage message
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
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
X-List-Received-Date: Thu, 10 Dec 2015 01:03:46 -0000

On Wed, Dec 9, 2015 at 4:40 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>
> ---
>  btbridged.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/btbridged.c b/btbridged.c
> index 115ae63..ab4880c 100644
> --- a/btbridged.c
> +++ b/btbridged.c
> @@ -584,7 +584,8 @@ out:
>
>  static void usage(const char *name)
>  {
> -       fprintf(stderr, "Usage %s\n", name);
> +       fprintf(stderr, "Usage %s [ --debug | --verbose ]\n", name);
> +       fprintf(stderr, "\t--debug\t Implies --verbose\n\t Dumps entire message contents to console\n");

I don't know what this means. What's the difference between debug and verbose?

It might be more discoverable to support multiple levels of verbosity.
-v for verbose, -vv for what you term "debug".

>         fprintf(stderr, "\t--verbose\t Be verbose\n\n");
>  }
>
> --
> 2.6.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
