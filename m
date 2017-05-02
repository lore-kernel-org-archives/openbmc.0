Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHCBN1MxkzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gvVsoXYP"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id l192so5643585ybl.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qE1Ia++9DE+NHpqoIea8JbddWndPxqTwZO4HMah/WwY=;
 b=gvVsoXYPEzJgVwfITtAM5SVzjN4dCosV65LFzdzYbc1u8Ge9SLJJUXoN92OkJPaqlo
 oE7TiJ+0HwnqixViF0jx6w3ehSdAglZhIxDAk9rw5J7P86drj+Fam5dXez7nJquwkrlW
 IhxU+zmkcQx8PWSVvLYylmlIrlvJqdOKBnhqDxK6QIRD5QDA5PCd4QMGnnsi1YJbv1rv
 2/4CmEzPT13sA08k8cL+R1t83XOklN8YGRX1K0RlUm80L7njeqnB5LlTYaIb5UWWsX/I
 +EcWfJz2HYPWFqtfP/GpDf/3TU4mY/Xyp+yFa+JHZ9xCigmWqamfrxjTYG5R4LQrB6jH
 v4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qE1Ia++9DE+NHpqoIea8JbddWndPxqTwZO4HMah/WwY=;
 b=uLqq94PJMUSrYeEVVuHUp600Btc19kH5J1Oyi++2bLzBfqZM412wN8bkpnA4FplHhj
 dfOs19NZcQ74i6KcgUTu6oatPi3de+8MLjzFJMInLpc241s9g+kf9qfPIMQCgue8QHKt
 LyqwB2kEDE/lSPY01j8FiLDix65fZgJiTkBC+VQZ4ReMAjazvaQVaCaj2VuJxUsOolTw
 eiGArR7iOA4zzeUox2Kc2GTK9ytOfuJ4SdXuYyCOuhcIuwfpBKp6yxzSclap5tE7aAUX
 rvxUHIFNN6dULaMF1BXr6iVtW3+xBaIXgqm+gaZRNmdik6PKJxjHhgosblmFZS1aUqqk
 ogow==
X-Gm-Message-State: AN3rC/7LyweVTUkIyzVPL5HkuXZEclrAtbwwmjf9dEMrFA2TPAd2zEy9
 OB90Vbl+Pr4Gq6sZIs/DJVjhYO7Ihw==
X-Received: by 10.37.219.20 with SMTP id g20mr23612633ybf.135.1493709065444;
 Tue, 02 May 2017 00:11:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 2 May 2017 00:10:44 -0700 (PDT)
In-Reply-To: <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-12-andrew@aj.id.au>
 <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 16:40:44 +0930
X-Google-Sender-Auth: TudhhSx3HHM4jx6olPSj6YIFuIM
Message-ID: <CACPK8XftiHpuSzjgk996+QTnSMKcsEKpm--6UDr6bn7iH5=WbQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 11/11] aspeed: zaius: Disable GPIO bias
 via devicetree pinconf requests
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 02 May 2017 07:11:08 -0000

On Sat, Apr 29, 2017 at 6:03 AM, Xo Wang <xow@google.com> wrote:
> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> +OpenBMC list
>
> Reviewed-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
