Return-Path: <sjg@google.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXF9n4fchzDvhD
 for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2016 17:25:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Yu1rn0ZD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="UoOctJM8";
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id w63so329438267oiw.0
 for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2016 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cU5r0d2bU3c2jFd03e+i9lLn844s6HH7YQj/mh6t4KQ=;
 b=Yu1rn0ZDqBlhaRSFP9gqV1NnwR2Bq4+vLBxDWZpC3A1jzbydkdMjo7fvaVJOb3pkuR
 kFR2VJLGWzPKRbaWiXDz4di95sc9JzCaCl0SFnU+Dc9ULorZwzud5EUo1QIqH/cHn4+o
 Mp0H31yAqSErgleQkyvtGqkqJmld2giCd9BAGxH54EuIGUsygACVMw3LJ4zj55S909KC
 HKUWsud59Wg5+ayokzHSGF6+a1I31dKagJ327x/heEd7G2L5rXKV2IJS8WO9cHoqOymW
 j168acrQ1hvUSTrobKLEcbJyd47geAKXSgNvb+v/3ON8UmquFBVRp3UXlUr9BZqzNK7L
 lQtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cU5r0d2bU3c2jFd03e+i9lLn844s6HH7YQj/mh6t4KQ=;
 b=UoOctJM8eHav9a8/05wwqM+elNTWM4xugFvQ65pfL/CWqKkY2H4+M/7Jdd/zfy3V1m
 mm00oLshpQMJsXBusoulTPPe/D3Ql7pNht76T0YeQ2NlU1JDMkByOvStUCMxf0U2YSUR
 fRsxsyhMu7xk3dgXlmWgUm0XkiZpUPle/OQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cU5r0d2bU3c2jFd03e+i9lLn844s6HH7YQj/mh6t4KQ=;
 b=WoI+Zl9cTdPR9UKiQM4vkN/39v8YEIdDD4WVY3lWjpIzRi42nCVJTq2Fex9lNcBUt+
 2VrfTFtfHD8aSHF5a6K4e0MDmquui29unbaT8+QMNMXpMYqaLhmM8XJxDS4GRG16jyo9
 IF+rggK1w8gCUfylqRw5IeXtuKT8CM+LVNtQsw/EbLrFQ80D0iUdVpMFcmRaI16fz0jt
 CAGJi+RnGLu0SSiVRNckfJleE/HZOCgYiNDC1rdjtiHE041rJTCrnf7Y/M2Zb1gmBr7A
 Q9LKG81+1g+pDTKOsvUDQ5XbMjJjv1BKvAkDIRZlUjd6+EuIipit95LSiZfhUVul6hHR
 t+rg==
X-Gm-Message-State: AKaTC03vEVZZYyWysbXIfBtUKu+VPZ7Ro940SDYO/8xvcJYra1kPlfFmcmMbtKlUIRvzqVKlyeBxXhwXHjpBpj9s
X-Received: by 10.157.32.6 with SMTP id n6mr28835811ota.106.1480919115809;
 Sun, 04 Dec 2016 22:25:15 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.128.229 with HTTP; Sun, 4 Dec 2016 22:24:55 -0800 (PST)
In-Reply-To: <1480717624-24994-2-git-send-email-raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-2-git-send-email-raltherr@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Dec 2016 23:24:55 -0700
X-Google-Sender-Auth: T0REkdMTD27QJc-t4JA0TR-po6g
Message-ID: <CAPnjgZ3WpLrsHMARpbkdSRzTd51y4Noi+fYYh+tVncWgG5pUBw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 1/3] aspeed: remove hack loading ramdisk in
 memory
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 05 Dec 2016 06:25:18 -0000

On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  common/image.c | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
