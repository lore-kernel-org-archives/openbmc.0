Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBNKV4CV1zDrFQ
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 11:45:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tu5Yts5D"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id o202so1063380itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 18:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oPAZEgDlIN0Y5LIlon2Z6FpHaiTwrAU9GXnalXlnY9o=;
 b=tu5Yts5DcwfJ3tchn/pr5VuLtJObmT2vQhbbUHdl8wrgj3TgPx+auGobXxe4Uq8rqt
 iHL8dIoF/UJ3iwF+jw3IactsT3ZlNOsg8ivwjcrrETcY3Jkg1Ua38LFA8TsKJys853jm
 d8ClRjSYzEGENLjO7KDVrB07LCf3QilmqcT0VsAY3h3EdSY5tPnnpe/HWJA8+g/4QBye
 /ZBMJrZKuir+Hh4dna4ksbWwzvYbPRgWoeTBK/rFQiHzYEk0UBpec31wQ9npCSH80lft
 kl46sJQ+v88KJ8xqp9BQmwAHS6s5jjbfbIJ/X+R4PglLf+bqTSTw6nKuL5xnkITlruUr
 HHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oPAZEgDlIN0Y5LIlon2Z6FpHaiTwrAU9GXnalXlnY9o=;
 b=i/uIzUQqiCNaJp2wfrtslU+3wpoctgC2KtzHjxQ7+tEToZ8N5CJnCv6H0oSRT93aXM
 Wa5lTU9imLqz/fEpf5rNkpN27H0AljZG7SgG8WNmGumYyfjovMpd51DgA6r12SnG/tO9
 x5MdcMbvOqu9Y0H2EjhNumGdPIz2HtlIINdYeRpnw/DM8gP7cKVLtxBWKuXLWuuJB9xJ
 wuj6867SQ2qvVh2LIJQfjGRqxr1JhMbyl4XGE9VlzO1esNtd5jgdOz04ZKKftBfiZw17
 3Jz3OAo7q5SSiZgzGUvXtLPbLIt4IW2Z/tcl1wXpbVY39yVHL2zhOejgwvzXVqHxlosL
 dVdw==
X-Gm-Message-State: AIVw112vhAq3DG0z0IENn0ZOjNR+aKClnmLtXiH7NiOJmr33Ndtr7tox
 gsmk4ClCgbqPxehwQUGko4PeQO55FLoQ
X-Received: by 10.36.61.1 with SMTP id n1mr379581itn.32.1500342347779; Mon, 17
 Jul 2017 18:45:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.36.205 with HTTP; Mon, 17 Jul 2017 18:45:46 -0700 (PDT)
In-Reply-To: <1500321334-11189-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1500321334-11189-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 17 Jul 2017 20:45:46 -0500
Message-ID: <CALLMt=pRW8N=CoC7zVOgDcRcZiD_f336w4Mwh0EGOqK3RwR-Dg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Change power sensor
 type a0 attributes
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 18 Jul 2017 01:45:51 -0000

On Mon, Jul 17, 2017 at 2:55 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Needed to be more standard.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 74 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 58 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4e3e411..8b0a008 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -565,6 +565,14 @@ static ssize_t occ_show_power_a0(struct device *dev,
>         case 14:
>                 val = get_unaligned_be64(&power->vdn.accumulator);
>                 break;
> +       case 15:
> +               return snprintf(buf, PAGE_SIZE - 1, "system\n");
> +       case 16:
> +               return snprintf(buf, PAGE_SIZE - 1, "proc\n");
> +       case 17:
> +               return snprintf(buf, PAGE_SIZE - 1, "vdd\n");
> +       case 18:
> +               return snprintf(buf, PAGE_SIZE - 1, "vdn\n");
>         }
>
>         return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
> @@ -804,7 +812,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
>                 show_power = occ_show_power_2;
>                 break;
>         case 0xA0:
> -               occ->num_attrs += (sensors->power.num_sensors * 15);
> +               occ->num_attrs += (sensors->power.num_sensors * 19);
>                 show_power = occ_show_power_a0;
>                 break;
>         default:
> @@ -888,91 +896,125 @@ int occ_setup_sensor_attrs(struct occ *occ)
>                         s = i + 1;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_label", s);
> +                                "power%d_id", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 0, i);
>                         attr++;
>
> +                       /* system power attributes */
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_system_update_time", s);
> +                                "power%d_label", s);
> +                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> +                                                    show_power, NULL, 15, i);
> +                       attr++;
> +
> +                       snprintf(attr->name, sizeof(attr->name),
> +                                "power%d_update_time", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 1, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_system_value", s);
> +                                "power%d_input", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 2, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_system_update_tag", s);
> +                                "power%d_update_tag", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 3, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_system_accumulator", s);
> +                                "power%d_accumulator", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 4, i);
>                         attr++;
>
> +                       s++;
> +
> +                       /* proc power attributes */
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_proc_update_time", s);
> +                                "power%d_label", s);
> +                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> +                                                    show_power, NULL, 16, i);
> +                       attr++;
> +
> +                       snprintf(attr->name, sizeof(attr->name),
> +                                "power%d_update_time", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 5, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_proc_value", s);
> +                                "power%d_input", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 6, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_proc_update_tag", s);
> +                                "power%d_update_tag", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 7, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_proc_accumulator", s);
> +                                "power%d_accumulator", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 8, i);
>                         attr++;
>
> +                       s++;
> +
> +                       /* vdd power attributes */
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdd_value", s);
> +                                "power%d_label", s);
> +                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> +                                                    show_power, NULL, 17, i);
> +                       attr++;
> +
> +                       snprintf(attr->name, sizeof(attr->name),
> +                                "power%d_input", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 9, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdd_update_tag", s);
> +                                "power%d_update_tag", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 10, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdd_accumulator", s);
> +                                "power%d_accumulator", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 11, i);
>                         attr++;
>
> +                       s++;
> +
> +                       /* vdn power attributes */
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdn_value", s);
> +                                "power%d_label", s);
> +                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> +                                                    show_power, NULL, 18, i);
> +                       attr++;
> +
> +                       snprintf(attr->name, sizeof(attr->name),
> +                                "power%d_input", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 12, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdn_update_tag", s);
> +                                "power%d_update_tag", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 13, i);
>                         attr++;
>
>                         snprintf(attr->name, sizeof(attr->name),
> -                                "power%d_vdn_accumulator", s);
> +                                "power%d_accumulator", s);
>                         attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>                                                      show_power, NULL, 14, i);
>                         attr++;
> --
> 1.8.3.1
>

Tested-by: Andrew Geissler <geissonator@gmail.com>

Eddie provided me this patch (plus his zaius gpio one) up in gerrit
via https://gerrit.openbmc-project.xyz/#/c/5243/ which I then verified
my hwmon conf files on top of.
