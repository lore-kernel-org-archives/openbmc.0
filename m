Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDhZ774YwzDvf5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 10:03:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AXunoeHr"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id e187so24946482itc.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 15:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=m6drb18ER4Bh7DNrzvZNfiZ4wazkDOvrrzbyt+kgCpM=;
 b=AXunoeHrLCg54xHPJHuO9nv6PNGGxkbASQXs56bKTxpomS3aa9+5yF0WmT8ZwkXwdd
 IWmrjebvySzd4NrRCLlZcOh6U8mq0d/dMe5JuTJFowQ7DlVGI88RSRHKMRtIrGYkQLU5
 wFiSb5zmZjLaDa1naBwJPSyPs9zX/q7KPrXmqlPg5C91tE1Kaah5gRXIv6jZx5YvITUM
 fICe2IiJU2F5U/ow0G8VfHXusDwVJJ0Ef2CV1W3ljokp4NlAwhe1ruo2Xjqtf7z443lU
 Fj2EO4pSclJwhJvBzSJYFVmw5ws1s7nnbQmTmCPlIlGryfFt6Izda0O6G4kvRuM2jLul
 s+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=m6drb18ER4Bh7DNrzvZNfiZ4wazkDOvrrzbyt+kgCpM=;
 b=P0TKFZEeZz7KoHau2AE3AWihdxEBvq8JGrX2Kt00i5YzEYnqPUnm0QgZvrAZ71wojH
 /ft+3nNwZaIZkKORBa6i3HhGRiCwQx5vYmOwF69kn8z/FpXovSPbNonLBp15sEwF2wgY
 FIRxmd8m8dSbhpZ2G7tCAwqbtebZfxikVdiH8xAkfJnsc95Y9ki6Zg7ah8PAh230g9nF
 id+Wym34R49SJV11CYRORyZCCCsKxnyFKWJrXmIc9zJ7S3XyIwWRavnGkEBB9Newn2q7
 CPek2fQkQmWMnzsCxHwjlO+2dSPocwY2K54jPR7G9OBqbs+ZbKZND9cp1lc5DxXQzHQQ
 BbiQ==
X-Gm-Message-State: ABUngvfRYeRQxHlgJmRy+n7QvALKnvgb3KXY7000gyT2q2AMN+o53gX9hI10CxsEygrd6Zec+3W6pSvYnMSgZQ==
X-Received: by 10.157.20.142 with SMTP id d14mr1039376ote.74.1478732637813;
 Wed, 09 Nov 2016 15:03:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 9 Nov 2016 15:03:37 -0800 (PST)
In-Reply-To: <1478711933-11135-1-git-send-email-mine260309@gmail.com>
References: <1478711933-11135-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 09:33:37 +1030
X-Google-Sender-Auth: G_QSAbBopM52xItxQu6yNYnE1go
Message-ID: <CACPK8XdG1zTygC-HCs80FJRrasDmSdviEm9C1GOm4uiOizY_EA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: witherspoon: Add bmp180
 sensor
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 23:04:00 -0000

On Thu, Nov 10, 2016 at 3:48 AM, Lei YU <mine260309@gmail.com> wrote:
> Add BMP180 thermal sensor.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.7.

Cheers,

Joel
