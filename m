Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KwRBJO8e"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vrwg67kjzF0hg
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 23:23:47 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id i26-v6so8488558pfo.12
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=En+C8O0Z+dTrQrSfTMTLa1MHmF6QFSrCv5+kSWP2oQ0=;
 b=KwRBJO8eS+l5cYH4pHzZtK727naS9PgQ/oxD7ZxqchNJ27d9CknhLE/YMjILnMF6v0
 37H0E8veLX8ux+Sl1DfX4I7GdjiW1NrBh4vPDWSYS3sLXacFNsSZHcljYK5cfQHYkQvq
 Bh8l6xgdRwbuDf/33CnyPmtxUhx5GOxOBtiGbL90fdoMSJNYo4D/3L56SO3I+kijW5C/
 GwbgbKJbVTZxwP7Dsa5ppV7oKcBXeosBV22mTbizwgDG1EyZHtL4nYhyCinQ2V3g3XBO
 TApB4K2XEJrvD+6fIpoyn30zvLdiv/zGXZecKmTU3Z8zxipZM39phguqznXcobfxWr3r
 EJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=En+C8O0Z+dTrQrSfTMTLa1MHmF6QFSrCv5+kSWP2oQ0=;
 b=qw2N7OPIqyGxZ9pNY/JJDcin1wSqrj4UWov57yQ4tsvR+i+LPDgx+ciHRU7VDG/56Q
 Y1Rg2PlvtGYbPPsHECDnj3AlDv2ifU3MZX03WoXxnFVof+zjyQXn3zfAUXfWW10m+shl
 6kG85T6Kzjzl8A3rSuFHabwTyERumMfxLuJ9E7wNgAJx2C2kQuxhyJik+MxM64S5/T8g
 A4ZO5+N2x0jdfiGwaP7xCl00kRzl7/mD3+Il1doLz/RjGkSAqZb0zvlvbKgLgafDMsQw
 uRDH1Xgvb9BnTKYspL6TpDUQliLmSPcn6UMf0kAyV5XZioBtDxZb4H+NMi3ynYZYo4Md
 kILw==
X-Gm-Message-State: AOUpUlGX0bpieeJeXFcUDUAvRbzvupPv/Jv3+0UvAcbQl8onPERqPx54
 5nhZrUv1OCgpshSjen7i2mazerFxnw4JfTY1z/IiEA==
X-Google-Smtp-Source: AA+uWPy5BlKnz8Ecvw4TCFIE/qUQnlGfXkWXpD4hb+qkJuvoXf/eDYIdbsqXMWP6YTaEnoqdjGPnaVByUCyO0XCD2t4=
X-Received: by 2002:a63:a011:: with SMTP id
 r17-v6mr45766821pge.90.1534857825042; 
 Tue, 21 Aug 2018 06:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADKL2t4bP5VKSZ3x9wiq4c+O-6JM=nFQgQjtTTBL_2i0e7zfzw@mail.gmail.com>
 <CAARXrtm4V-g6gH9iGKFHrE+LmOUvkG-thv+q9e7u335nQsYFqw@mail.gmail.com>
In-Reply-To: <CAARXrtm4V-g6gH9iGKFHrE+LmOUvkG-thv+q9e7u335nQsYFqw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 21 Aug 2018 06:23:33 -0700
Message-ID: <CAO=notx+-Qb8j3GYYpsgqcEHkP3janMb3ivgAyZYpxksNiYjig@mail.gmail.com>
Subject: Re: Sensor alarm logging in IPMI SEL
To: Lei YU <mine260309@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 21 Aug 2018 13:23:49 -0000

On Mon, Aug 20, 2018 at 8:03 PM Lei YU <mine260309@gmail.com> wrote:
>
> The existing phosphor-dbus-monitor should be able to do that.
> It requires a yaml config to define the watches and actions.
>
> See [witherspoon example][1], that watches the properties (ThrottleProcTemp,
> ThrottleProcPower, ThrottleMemTemp) on /org/open_power/control/occ0, and log
> the related events.
>
> 1. https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/events/witherspoon-events-policy/config.yaml
>
> On Tue, Aug 21, 2018 at 3:53 AM Benjamin Fair <benjaminfair@google.com> wrote:
> >
> > Hi all,
> >
> > We are looking for a way to log and report sensor events such as
> > over-temperature alarms and voltage regulator failures using the BMC.
> > The IPMI SEL seems like a good approach, as it matches industry
> > standards. There is already existing infrastructure for SEL in
> > OpenBMC, so implementing this seems like it would only require
> > modifying a daemon like sensord from the lm-sensors project to report
> > alarms over dbus.
> >
> > Does this sound reasonable? Has anyone else already started working on
> > something similar?

So the phosphor-hwmon daemon itself has the notion of a configured
threshold where if the value is beyond some point it sets the dbus
property for that sensor.  It doesn't yet, unless I've missed some
patches, respond to a hwmon sensor's alerts.  That may be a useful
feature to develop into phosphor-hwmon.

Patrick

> >
> > Thanks,
> > Benjamin
