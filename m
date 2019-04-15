Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIR7LANN"; 
 dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jdVV0Lt6zDqDf
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 05:14:57 +1000 (AEST)
Received: by mail-ua1-x92c.google.com with SMTP id a46so5898783uae.2
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+KOigUY958qLdF2jFnrZyZpoY4aOyXa9PD/YJ8FTSOU=;
 b=lIR7LANNX/YlB7yN/7WZUUa8mqZsh/AKqZXfZMfVpjdF/I76YVwlzS9pzQgDXI6X42
 32XHyVIVe23Csdw1pImacaMH8cGGhJfqUCu/3AGABALJBrX84Ju/sfVfzbEtBFqXkN6x
 eYE02ife5FMPb8ADHgWRQRyHBDPDZ1LCcgHv60RyHJz52C223MEk2hVqN8FHeIfUEF9h
 yG8IPK5hWyXgUDVIVz8xTFZ0DOtWMOgW/rWCnQlHyYf/ZaaftquYOCXgt3IQUVWjRwN3
 I6ntOR/gipcYipKWyekNvVuOhbhcyNPkxUD3vGdxjrQUfzVG1dxaJSAYEaEPvE6yt+yh
 b9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+KOigUY958qLdF2jFnrZyZpoY4aOyXa9PD/YJ8FTSOU=;
 b=JcuZjvzxezVkjzmgS1Qo3N1+60YfrmKyIXQ2Z9bq1H5Lfzz1aCORNQozTOIp9Jro4v
 irEpBwKmUilxmb7LFvYruW2PBkl3HWbG4SnasxmpUHbGomSav7EouEToTND0kJjvwI7R
 RX5TfEv7Q2ElDEdEtcCz9YgHEoOOo4GsaJWWMuu/i3Uxh7IBOMJ41xdIZrYqdlD96vXK
 lGOTPbyeCZVoUa/ZuPagAsQmiYdKTIlsCY3P/9GnFyMk0w2amQ8YsdgGVCLuqtZ9HoKr
 RvyLBQ09Y5is30porotIifHUpq3uO0AR2YB8OAd3D2LECqPmBgWH1isX2qlErqpieNJf
 S9xg==
X-Gm-Message-State: APjAAAVIl1vPSXveEQQ6xSFEMq7XdbnLO7Hk4Xt1Sr+LoncDQPium/Kk
 GHQCtsAfaBQnVC1cgtgS5wuDmxqnrkg1bnfhKmygtg==
X-Google-Smtp-Source: APXvYqyy0LZsVELZT+TApyZhE1LfoBXWgeFt3YSSqLXqKUg4OPiwclbc9b5RkZ7NsNaiw+z4w8wwbTlaMnXku+hasYs=
X-Received: by 2002:ab0:7686:: with SMTP id v6mr38106843uaq.77.1555355694516; 
 Mon, 15 Apr 2019 12:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <9F16AAB7177A1645BBAFF66396C46B0E7A310105@CNMAILEX03.lenovo.com>
In-Reply-To: <9F16AAB7177A1645BBAFF66396C46B0E7A310105@CNMAILEX03.lenovo.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 15 Apr 2019 14:14:43 -0500
Message-ID: <CAG5OiwhQqLsUQ15QJawK_kZhSb6sn8dBhD+RFyecM6Oz9YRTRQ@mail.gmail.com>
Subject: Re: Add member into Lenovo designated employees list
To: Duke KH Du <dukh@lenovo.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2019 19:14:58 -0000

Done. I have created a new version of your CCLA and have added Lisa Liu to =
it.

Thank you for keeping this document up to date.

Kurt Taylor (krtaylor)

On Mon, Apr 8, 2019 at 10:44 PM Duke KH Du <dukh@lenovo.com> wrote:
>
> Hi master,
>
>
>
> I would like to add our new member in Lenovo designated employees list as=
 below in RED color.
>
>
>
> Could you help on it?
>
> Thanks.
>
>
>
> Schedule A
>
> Initial list of designated employees. NB: authorization is not tied to pa=
rticular Contributions.
>
> Please indicate =E2=80=9CCLA Manager=E2=80=9D next to the name of any emp=
loyees listed below that are
>
> authorized to add or remove designated employees from this list in the fu=
ture.
>
>
>
> CLA Manager:
>
> Duke Du dukh@lenovo.com
>
>
>
> Other designated employees:
>
> Andrew Peng pengms1@lenovo.com
>
>
>
> Yonghui Liu liuyh21@lenovo.com
>
>
>
> Lisa Liu liuyj19@lenovo.com
>
>
