Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJdwF03NlzDq8X
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 11:18:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJzdmH8l"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id f2so14224177uaf.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 16:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NLAtN2WrfM95EXoS+3fPyw1Dfqjdh+zSBK9jjQhuhOw=;
 b=SJzdmH8leAcpjwJNdQXjYqA6bUnqEqw3dFwfjqXzyj+3Pj4gZXDmbc86B2VpUGWffH
 rTXNHIaUSvjxiMRd33IbBD2TE2zLmH5REKSeUa6UfjDMJECMuc8Ddcfu4/3coXjHezEs
 KRoWUzHSHBum4LF+svEAje0KpcDJpWKNFmPIYQSvh5cI4GlTHG3+11XhsHLVwdWQVX5i
 o3nBWcOz+BcfM9w5Ry4dPdlOMlrOr9nUOMNCXOn/iqx8A94/ZvN+1wCmHbtoC0SmJDKF
 1fpANgv5Uhk6PwTCyZja4YYAQJP42Yatbp115VRR1rwjebqTwmS1qk51MupKTR9EzmwK
 +jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NLAtN2WrfM95EXoS+3fPyw1Dfqjdh+zSBK9jjQhuhOw=;
 b=pcayTBGTLcrvkx/PyIHBk35OmN/eezb/fFyvZ4PHom1QaJqvc1cyWAzXjafWc9pnx9
 T9KNFHjAkox00dzVTZxj+5IUEys42cVOqiyAPfUe7V/b5VP6Ifp1ucHfG8maMw0e4KUS
 ao6l5qW0RlicBKSgcULq/Y+iS9HWCnkBfCpo/+lkC6/M8Masbk0//daKdIKbKrTLTCQb
 FJ8hsxwR7WQhNvlMqnNMLloaJefRjhau7ZOLMCew6fImUkdDe6pkbD5QCa15YuRYVE1k
 qDbD1VtFpMyph3ZOZvQczj4tVxxHbHN3HM1qJQJ2jD13pW1gKkT3Cy3t8EXcWnfmHXDa
 jEEg==
X-Gm-Message-State: AMke39nlaY+EP1v1cU2dOBEFUhezrfOzFm6F2qVNpca82cwY/K8iYLmErGpbsw1nLrrKhirXYxlmWebgFBHqjQ==
X-Received: by 10.159.36.165 with SMTP id 34mr176801uar.48.1486599514054; Wed,
 08 Feb 2017 16:18:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 16:18:13 -0800 (PST)
In-Reply-To: <20170208233350.56069-1-cbostic@linux.vnet.ibm.com>
References: <20170208233350.56069-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 10:48:13 +1030
X-Google-Sender-Auth: CvSns3jLcM3rt28JAdbaeRqr8hg
Message-ID: <CACPK8XdP-imVAz1Jo+1pk-7HK0+xkqDswjK7nH+p02XoZh5RRA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Adjust slave ID based on
 address in command send
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, 
 Eddie James <eajames.ibm@gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 00:18:37 -0000

On Thu, Feb 9, 2017 at 10:03 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> In order to access slave address ranges > 0x1FFFFF the slave ID
> must be adjusted accordingly in the command encoding:
>
> ID 0: 0x00000000 - 0x001FFFFF
> ID 1: 0x00200000 - 0x003FFFFF
> ID 2: 0x00400000 - 0x005FFFFF
> ID 3: 0x00600000 - 0x007FFFFF

Alistair and Eddie, can I please get an ack from both of you on this?

>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 73d9985..428f3db 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -30,7 +30,9 @@
>  #define        FSI_GPIO_CMD_READ       0x0400000000000000ULL
>  #define        FSI_GPIO_CMD_SLAVE_MASK 0xC000000000000000ULL
>  #define        FSI_GPIO_CMD_ADDR_SHIFT 37
> -#define        FSI_GPIO_CMD_ADDR_MASK  0x001FFFFF
> +#define        FSI_GPIO_CMD_ADR8_MASK  0x001FFFFF
> +#define        FSI_GPIO_CMD_ADR16_MASK 0x001FFFFE
> +#define        FSI_GPIO_CMD_ADR32_MASK 0x001FFFFC
>  #define        FSI_GPIO_CMD_SLV_SHIFT  62
>  #define        FSI_GPIO_CMD_SIZE_16    0x0000001000000000ULL
>  #define        FSI_GPIO_CMD_SIZE_32    0x0000003000000000ULL
> @@ -40,6 +42,9 @@
>  #define        FSI_GPIO_CMD_DFLT_LEN   28
>  #define        FSI_GPIO_CMD_CRC_SHIFT  60
>
> +#define        FSI_SLAVE_SHIFT         21
> +#define        FSI_SLAVE_MASK          0x3
> +
>  /* Bus errors */
>  #define        FSI_GPIO_ERR_BUSY       1       /* Slave stuck in busy state */
>  #define        FSI_GPIO_RESP_ERRA      2       /* Any (misc) Error */
> @@ -301,15 +306,17 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>                 const void *data)
>  {
>         uint8_t crc;
> +       uint32_t addr_mask;
>
>         cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
>         cmd->msg = FSI_GPIO_CMD_DEFAULT;
>         cmd->msg |= mode;
> -       cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
> +       if (!slave)
> +               slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
>         cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
> -       addr &= FSI_GPIO_CMD_ADDR_MASK;
> -       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
> +
>         if (size == sizeof(uint8_t)) {
> +               addr_mask = FSI_GPIO_CMD_ADR8_MASK;
>                 if (data) {
>                         uint8_t cmd_data = *((uint8_t *)data);
>
> @@ -317,6 +324,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>                                 ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT8_SHIFT;
>                 }
>         } else if (size == sizeof(uint16_t)) {
> +               addr_mask = FSI_GPIO_CMD_ADR16_MASK;
>                 cmd->msg |= FSI_GPIO_CMD_SIZE_16;
>                 if (data) {
>                         uint16_t cmd_data;
> @@ -326,6 +334,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>                                 ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT16_SHIFT;
>                 }
>         } else {
> +               addr_mask = FSI_GPIO_CMD_ADR32_MASK;
>                 cmd->msg |= FSI_GPIO_CMD_SIZE_32;
>                 if (data) {
>                         uint32_t cmd_data;
> @@ -336,6 +345,9 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>                 }
>         }
>
> +       addr &= addr_mask;
> +       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
> +
>         if (mode == FSI_GPIO_CMD_WRITE)
>                 cmd->bits += (8 * size);
>
> --
> 1.8.2.2
>
