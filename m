Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p2OuOEWv"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vb8c40mLzDqnw
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 13:03:12 +1000 (AEST)
Received: by mail-it0-x22f.google.com with SMTP id d9-v6so2302744itf.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 20:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z53f0GHwGiu68rRGYYWpIdDg23BbZpw69cDcYxYMNPk=;
 b=p2OuOEWvvHycaM56nRLXScwbixT5S2utD3o8l3Lq435Gpj+Gc2zvdfRQ1en7jifXJB
 Pc8oEQC1O1MaCQnEyq2XRnZCi2RDVlKofLyfa0Z9dw585WQAQP1P2e29ICEKHPnNUg2r
 ePms5T1Kn7bqUax6LgiuzznmlE4P4j1S/3XIp3KYdP8hserLCv53OphztQgED2xRFqDn
 7SQz/y9PTZcepKwaWueVBMrBk0GKTmjkUKrGJpCnYYiLXZ87HS1+keOs9YkJthFUfqfR
 aN9pqDKnCY7RmnHZh6gObEK+JJ9nym6MxPzU+Coix6uNGSN6imqy7QrtDRxuF7T3BEpa
 ax/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z53f0GHwGiu68rRGYYWpIdDg23BbZpw69cDcYxYMNPk=;
 b=mlJRzJ8fuiN7aSfCRcpAOKC8IA8KvJyJvWUbLD/aCpxDFTMBcaVSLIVaCwgwrsp0qK
 2wYBBuDVjYPx/RGRT3KxJ95LiCD3kY2UQEe5fhcSz5ytXkDwrlexlOeEWkXiQ0bQye/p
 V/+P9rGGS+cP/m0C94fV8mGWJeTrJO0jq4xQCKP4oxxMWvCZfExD+aL0lLiJF6u3Znj9
 /2tjP1o1eZ+n1zu0zLNRa2SRhd5DPZAKDSBCFBJUkmoXPWgT2a0ANuq5tGmRn9O+IrdY
 iANS618TQjqNW+0/dPR8BXgoZkguew61fjn4s6K5nVl4wr4ZieOCo8Btvgs1HfAr1ZfQ
 Xhtw==
X-Gm-Message-State: AOUpUlHdgT7z3J+eSfsHJNI4XLP0xfG0WSKYx4oUny3wSNrnxO9Qj2ZK
 CzUSqX/GrWz5KwsNwB3F3T2Ez5qfXauaciq5MWY=
X-Google-Smtp-Source: AA+uWPzJyglqCyQksullA9S1WES+lYKoW0quJ0m/EsvVCkRQCLy2XtqSd6atHeCH+wB+j51g2pF+YnfLBQVtNfDXRSM=
X-Received: by 2002:a24:14d8:: with SMTP id
 207-v6mr14436087itg.41.1534820589550; 
 Mon, 20 Aug 2018 20:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADKL2t4bP5VKSZ3x9wiq4c+O-6JM=nFQgQjtTTBL_2i0e7zfzw@mail.gmail.com>
In-Reply-To: <CADKL2t4bP5VKSZ3x9wiq4c+O-6JM=nFQgQjtTTBL_2i0e7zfzw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 21 Aug 2018 11:02:56 +0800
Message-ID: <CAARXrtm4V-g6gH9iGKFHrE+LmOUvkG-thv+q9e7u335nQsYFqw@mail.gmail.com>
Subject: Re: Sensor alarm logging in IPMI SEL
To: benjaminfair@google.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Aug 2018 03:03:13 -0000

The existing phosphor-dbus-monitor should be able to do that.
It requires a yaml config to define the watches and actions.

See [witherspoon example][1], that watches the properties (ThrottleProcTemp,
ThrottleProcPower, ThrottleMemTemp) on /org/open_power/control/occ0, and log
the related events.

1. https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/events/witherspoon-events-policy/config.yaml

On Tue, Aug 21, 2018 at 3:53 AM Benjamin Fair <benjaminfair@google.com> wrote:
>
> Hi all,
>
> We are looking for a way to log and report sensor events such as
> over-temperature alarms and voltage regulator failures using the BMC.
> The IPMI SEL seems like a good approach, as it matches industry
> standards. There is already existing infrastructure for SEL in
> OpenBMC, so implementing this seems like it would only require
> modifying a daemon like sensord from the lm-sensors project to report
> alarms over dbus.
>
> Does this sound reasonable? Has anyone else already started working on
> something similar?
>
> Thanks,
> Benjamin
