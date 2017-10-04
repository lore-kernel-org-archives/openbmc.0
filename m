Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pq0bx2FS"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6NT265xkzDqln
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 15:38:46 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id h80so4335192lfe.1
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 21:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u0hRYpR6CTivfhYWbzQO4qhwPhunoP1rluOvTqpbHtA=;
 b=Pq0bx2FSNlI4oK7VfGEoOlV1Ep19ui/DLuUXnk9/UrxmSu4Apsl2eOnan3LnvYQ8Dp
 cSnOckvaEnvOZx7SNc0y9kgRDciO2CXciJiQk9tyVQOt38gmxYz8N021N4Su5g206PQ0
 zNdnhfkZoBn5IUG4YRPqjBFxRYdNGvBo5LfqpHC6J4794SHuN0/Z/CYwBZ5SmVQ6SVjv
 EQKchg/WbBUzqG+QrRqb/SipJ2gcG0AkLoECJmyDdXoclykP3H6iIiEp8h+zugGqNW5f
 BhTeMhuXP7po9snQoITNQhPNFM4E1DExqTTTVW1kVOUea/IjskVLabaOkuxDC5P74TDK
 pU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u0hRYpR6CTivfhYWbzQO4qhwPhunoP1rluOvTqpbHtA=;
 b=XvzrcgvWPCLICXxAU6c1xz7psozfPvgdrcbq47UkODxPTJpudHzzccWHg06uv7ujEz
 lnqCWIJ2AmLOOMv1YcR4QPe57zzSZXanGyid1QyYy5EbYLycE2TUpjFIhVvyEQDIjdtY
 gr00ILmeU3qYy07cn/vahxUOfJRmELQUrwYu4Jy0VwelyUaIgcn1CpNnVMaAIz4GrM99
 3HQ9cij00o1tIKv7YTjX3/iSOMWDX6lfOwohFqYVaiEJj0naC1JhSDmTUpcMuRxsuTKA
 QSyMmWTj3NJ4y6nbaC+F85biPWCiVE1XN/2JIzbMRrAE7IQajRqUQ2ymkYTKwovUloGH
 s7tQ==
X-Gm-Message-State: AHPjjUhWNMifNurFEv5iw8s1hy857gKiBOky4rAdazzgbL1Li+5ITOY6
 3jB+YCis62tkULzFbStnlCi6Ewy28Lgo7xStaC0=
X-Google-Smtp-Source: AOwi7QByYx1bsevz920rFjtsNf7fVWEe4s2tArTJ3sqBcrlVbNnzQ0FEU1j9aJuFh45+UHy9V/nPANleMGQbEx5aqdA=
X-Received: by 10.46.88.68 with SMTP id x4mr9279648ljd.138.1507091923597; Tue,
 03 Oct 2017 21:38:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Tue, 3 Oct 2017 21:38:23 -0700 (PDT)
In-Reply-To: <1507058068-9406-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507058068-9406-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Oct 2017 14:08:23 +0930
X-Google-Sender-Auth: Y2KI8Qzcyvtcbhzv4oVZviJ2a3w
Message-ID: <CACPK8XfGubVuKRL=nTwbPbn5KMHtUvTULPZXvy=jYWPU_hbdDw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Revert "drivers/hwmon/occ: Add temperature
 fault attribute and VRM temp alarm"
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 04:38:47 -0000

On Wed, Oct 4, 2017 at 4:44 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This reverts commit e55423ee10a5057338d24383c00e813436a126ea.
>
> Apologies for pushing this up so early... Userspace applications aren't
> ready for this change. The hwmon polling application cannot accept EGAIN
> yet, and we can't be returning apparent errors if the sensor is
> temporarily unavailable.

Can you go into some more detail here please.

It looks like these changes are within the hwmon ABI, so userspace
that supports hwmon devices shouldn't break.

Cheers,

Joel

>
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 38 +++-----------------------------------
>  1 file changed, 3 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 8ffb556..34002fb 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -19,10 +19,6 @@
>  #define OCC_EXT_STAT_MEM_THROTTLE      0x20
>  #define OCC_EXT_STAT_QUICK_DROP                0x10
>
> -#define OCC_TEMP_SENSOR_FAULT          0xFF
> -
> -#define OCC_FRU_TYPE_VRM               3
> -
>  atomic_t occ_num_occs = ATOMIC_INIT(0);
>
>  struct temp_sensor_1 {
> @@ -381,23 +377,11 @@ static ssize_t occ_show_temp_2(struct device *dev,
>                 val = get_unaligned_be32(&temp->sensor_id);
>                 break;
>         case 1:
> -               val = temp->value;
> -               if (val == OCC_TEMP_SENSOR_FAULT)
> -                       return -EREMOTEIO;
> -
> -               if (temp->fru_type != OCC_FRU_TYPE_VRM) {
> -                       if (val == 0)
> -                               return -EAGAIN;
> -
> -                       val *= 1000;
> -               }
> +               val = temp->value * 1000;
>                 break;
>         case 2:
>                 val = temp->fru_type;
>                 break;
> -       case 3:
> -               val = temp->value == OCC_TEMP_SENSOR_FAULT;
> -               break;
>         }
>
>         return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
> @@ -796,7 +780,6 @@ static ssize_t occ_show_extended(struct device *dev,
>  int occ_setup_sensor_attrs(struct occ *occ)
>  {
>         unsigned int i, s;
> -       struct temp_sensor_2 *temp;
>         struct device *dev = occ->bus_dev;
>         struct occ_sensors *sensors = &occ->sensors;
>         struct occ_attribute *attr;
> @@ -816,7 +799,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
>                 occ->num_attrs += (sensors->temp.num_sensors * 2);
>                 break;
>         case 2:
> -               occ->num_attrs += (sensors->temp.num_sensors * 4);
> +               occ->num_attrs += (sensors->temp.num_sensors * 3);
>                 show_temp = occ_show_temp_2;
>                 break;
>         default:
> @@ -888,22 +871,13 @@ int occ_setup_sensor_attrs(struct occ *occ)
>
>         for (i = 0; i < sensors->temp.num_sensors; ++i) {
>                 s = i + 1;
> -               temp = ((struct temp_sensor_2 *)sensors->temp.data) + i;
>
>                 snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
>                 attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>                                              0, i);
>                 attr++;
>
> -               if (sensors->temp.version > 1 &&
> -                   temp->fru_type == OCC_FRU_TYPE_VRM) {
> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_alarm",
> -                                s);
> -               } else {
> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_input",
> -                                s);
> -               }
> -
> +               snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
>                 attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>                                              1, i);
>                 attr++;
> @@ -914,12 +888,6 @@ int occ_setup_sensor_attrs(struct occ *occ)
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_temp, NULL, 2, i);
>                         attr++;
> -
> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_fault",
> -                                s);
> -                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> -                                                    show_temp, NULL, 3, i);
> -                       attr++;
>                 }
>         }
>
> --
> 1.8.3.1
>
