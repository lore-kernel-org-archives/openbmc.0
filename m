Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wppz14hySzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 15:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2mj42P7"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id j65so1297406ybj.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=/O6WAMtmIFMH/Spjp+gqLMIjEDglLwkreZYWeAHsuio=;
 b=A2mj42P7m4bKf4nPXTG6KgHDMiIoACVB/haG6kb3E/YzHhEBzv09PvTtM5NbKGb4Yu
 5AzjQw3cN2AmQvQ+nS6EyG8LzGI9CV2eFRyuQEi63TGf5McMtHBjBKzBvBRky6jHuzYX
 Rb31/6aBrneHBvwjzDbEsD+xVp2hr3voQkPSr45Q0rn3EOt8Osym0vXQQhQyMiKAHnsG
 E5pEdt4VePbQvl96J38CDrOP6AJrt7KWYaXKIXfB6BQbGnlQ/H6IhuPD2ERT1/lYCT9w
 9mIAUR37d789x7Eo5TiMoLH//iAN8Ow4nWUtiIRPV4TB0V/eWyVH4a2e9yA5lUVGfDOH
 XRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=/O6WAMtmIFMH/Spjp+gqLMIjEDglLwkreZYWeAHsuio=;
 b=iT60aTLy/5i4qAJ1c96MFZQDDZfXMSwbhyWlsoMknXq0vDX107dAnzeaBBQ7EKS/An
 3kCfHMW5raE8HHUvMkxvA/fg4G39fBm/jHV+vZh4k9MjjZN+gQ4E3ZM0Syl7erDEOUMg
 WkZKaeWXU6PhCl+qTsCJg+aaei2spR4XdpfUrBriqHzE6jtlQiShTWv/7IMfHKGsYZBg
 Vc9XB0LcI/U0Qgh8wYYfXGAYH4drpg4nY2w7amhlJbmVrZZ1YCKJi74Z1qGbzdp7uvg9
 Cd7J+JWbjkIuLghOnnP2/lyJ1QLXOEzeJDJGd6dyyFKegl4yvgnVmfI95IHe+UakW43n
 OZUw==
X-Gm-Message-State: AKS2vOwrDRWZhHEcpmVzIfeHZs74xThg7/6RSZKTYylp/CHxB5dhUtwK
 T3uqhGwMxsAPXZl9b/lfcPPeAzzDUA==
X-Received: by 10.37.11.68 with SMTP id 65mr1790673ybl.94.1497591419531; Thu,
 15 Jun 2017 22:36:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 22:36:39 -0700 (PDT)
In-Reply-To: <1497031265-29545-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1497031265-29545-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:06:39 +0930
X-Google-Sender-Auth: qpBUUAAxrmHeup9DaOUgUXbrJSI
Message-ID: <CACPK8Xc9MNxxsj5EW8dyhtnSpbB9j4ayZAcO6ensPfRr9Q_K+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 2/5] drivers: hwmon: occ: Add new sensor
 versions and non-hwmon attributes
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 05:37:02 -0000

On Sat, Jun 10, 2017 at 3:31 AM, Eddie James <eajames@linux.vnet.ibm.com> w=
rote:

> +static ssize_t occ_show_status(struct device *dev,
> +                              struct device_attribute *attr, char *buf)
> +{
> +       int rc;
> +       int val;
> +       struct occ *occ =3D dev_get_drvdata(dev);
> +       struct occ_poll_response_header *header;
> +       struct sensor_device_attribute *sattr =3D to_sensor_dev_attr(attr=
);
> +
> +       rc =3D occ_update_response(occ);
> +       if (rc)
> +               return rc;
> +
> +       header =3D (struct occ_poll_response_header *)occ->resp.data;
> +
> +       switch (sattr->index) {
> +       case 0:
> +               val =3D header->status & OCC_STAT_ACTIVE;
> +               break;
> +       case 1:
> +               val =3D header->ext_status & OCC_EXT_STAT_DVFS_OT;
> +               break;
> +       case 2:
> +               val =3D header->ext_status & OCC_EXT_STAT_DVFS_POWER;
> +               break;
> +       case 3:
> +               val =3D header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
> +               break;
> +       case 4:
> +               val =3D header->ext_status & OCC_EXT_STAT_QUICK_DROP;
> +               break;
> +       case 5:
> +               val =3D header->occ_state;
> +               break;
> +       }
> +
> +       return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);

drivers/hwmon/occ/common.c: In function =E2=80=98occ_show_status=E2=80=99:
drivers/hwmon/occ/common.c:258:9: warning: =E2=80=98val=E2=80=99 may be use=
d
uninitialized in this function [-Wmaybe-uninitialized]
  return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Please fix this.
