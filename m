Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV1Tx22nfzDsFt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 10:31:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=G0n9Y+rP; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id u68so1203898uau.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 17:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=y0wS01aFn6Z5lgzUU+Nui91CeG3pCGX6qxEBqy2eu8g=;
 b=G0n9Y+rPXBPeYC7ZkXlHs0dBzuXSQOy7WuEH7ZWTMZc8doFXe/Xyv4LUCsepTJBP40
 +au0rdaCHcQgooEB8NgILSTOHNTT2OzyqL3h+Cx+lbJSNod1S6ZBZjxMRCjCpqPh6L/k
 D6TjkqeYnOca7ikzHRq4iqz5W6HJfQn3Ohg+6NsGT02r2KGCI+y/n3lotR0Tj0z8bEM5
 8fZFG7WEtpCcoghnt6wzITTi28dzvvXad4bKE1B79xJFxJiIezjDWTWER15bB3ZWjaTU
 TfnApehDlczIWIoLkrtR6WdHTbaPrwYT08Ss7/hIK9f5V4rshBxHif2EJFQ5eCHbH4Fw
 J8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=y0wS01aFn6Z5lgzUU+Nui91CeG3pCGX6qxEBqy2eu8g=;
 b=NScxcpX6iMwObjQ8QyvcJytOxylyywKucvVlXKtqzRBg2DD2mvlVZ1eBVXz+IxAOgU
 5aEcBewX14GI2ydBlDov/HveyHmBe0FkIRnUvxDYPZkYaYZWjx8to2eR2VQMEEskzAkx
 JrqfFrs17EYD6YEA6W9YLUfSZ/82V4WwJtSSUpP81mXc/jehA92sg68VcIv1Jl3JByKQ
 CkWkR9RYYCffW2xdFBBPedAV/emA/iymRSNqyAlFyNw9SjB4oMGUOpXMAtXJK83J3NOV
 jJKAuTOhoCq0Cbhjv9vJpkLsWM7a31rZHrqbVpPBf5MCPV1/Z8i5n9sApFHCoIYq0t34
 is1Q==
X-Gm-Message-State: AE9vXwMGN/5old3yTmCrmf+EtrpzisphJWc5/buAZMb510GtDfqhOpkHvKgHRxUNgSs07kZjpCYQdcQC19Bz8g==
X-Received: by 10.176.68.7 with SMTP id m7mr31611972uam.44.1473294674682; Wed,
 07 Sep 2016 17:31:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Wed, 7 Sep 2016 17:30:54 -0700 (PDT)
In-Reply-To: <1472839086-30137-1-git-send-email-maxims@google.com>
References: <1472839086-30137-1-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Sep 2016 10:00:54 +0930
X-Google-Sender-Auth: uU2xRo3egOf0D9pLSeDxbjBgHDk
Message-ID: <CACPK8XexZKE25KxJrd74Ly3iwvYBGcOr_A8oPFh0Z8BvVpaqMw@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Added ast_uart.{c, h} files, moved most of
 the diagnostic message printing to ast-g5.c
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Teddy Reed V <teddy.reed@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 00:31:18 -0000

Hello Maxim,

On Sat, Sep 3, 2016 at 3:28 AM,  <maxims@google.com> wrote:
> From: Maxim Sloyko <maxims@google.com>
>
> Set up a stack in SRAM at the beginning of lowlevel_init, which makes it
> possible to call non-trivial C functions, as well as put diagnostic
> strings themselves onto the stack.

Thanks for the patch. I am happy to see efforts to tame platform.S
into something we can maintain and upstream. Do you plan on continuing
this cleanup?

A bigger picture question: is there a good reason to retain these
messages at boot? I don't think they provide any use for developers.
They might be useful at bring up though. What are your thoughts?

>
> Several one-char writes to debug uart still remain in platform.S, I
> figured it's not worth it to make a separate call to c function for each
> of those.
> ---
>  arch/arm/include/asm/arch-aspeed/ast_uart.h | 142 +++++++++++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |   4 +-
>  arch/arm/mach-aspeed/Makefile               |   2 +-
>  arch/arm/mach-aspeed/ast_uart.c             |  38 +++
>  board/aspeed/ast-g5/ast-g5.c                | 110 ++++++++-
>  board/aspeed/ast-g5/platform.S              | 351 +++-------------------------
>  6 files changed, 318 insertions(+), 329 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/ast_uart.h
>  create mode 100644 arch/arm/mach-aspeed/ast_uart.c
>
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_uart.h b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> new file mode 100644
> index 0000000..ddf1a14
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> @@ -0,0 +1,142 @@
> +/*******************************************************************************
> + * Copyright (C) 2016 Google Inc
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + ******************************************************************************/

Drop the ascii art.

u-boot uses the  SPDX-License-Identifier tags. See
http://www.denx.de/wiki/U-Boot/Licensing

> +
> +#ifndef __AST_UART_H
> +#define __AST_UART_H
> +
> +#include <asm/io.h>
> +
> +#define AST_UART_RBR(uart)      (uart)
> +#define AST_UART_THR(uart)      (uart)
> +#define AST_UART_IER(uart)      ((uart) + 0x4)
> +#define AST_UART_IIR(uart)      ((uart) + 0x8)
> +#define AST_UART_FCR(uart)      ((uart) + 0x8)
> +#define AST_UART_LCR(uart)      ((uart) + 0xc)
> +#define AST_UART_MCR(uart)      ((uart) + 0x10)
> +#define AST_UART_LSR(uart)      ((uart) + 0x14)
> +#define AST_UART_MSR(uart)      ((uart) + 0x18)
> +#define AST_UART_SCR(uart)      ((uart) + 0x1c)
> +
> +/* These registers can only be written when DLAB = 1*/
> +#define AST_UART_DLL(uart)      ((uart))
> +#define AST_UART_DLH(uart)      ((uart) + 0x4)
> +
> +/* Registers' contents */
> +
> +#define AST_UART_IER_THRE       (1 << 7)
> +#define AST_UART_IER_EDSSI      (1 << 3)
> +#define AST_UART_IER_ELSI       (1 << 2)
> +#define AST_UART_IER_ETBEI      (1 << 1)
> +#define AST_UART_IER_ERBFI      (1 << 0)
> +
> +/* AND this mask with AST_UART_IIR to find out if FIFOs are enabled. */
> +#define AST_UART_IIR_FEN_MASK   (3 << 6)
> +
> +/* Bit0 == 0 means that the interrupt is pending, bits 3:1 identify
> + * interrupt.  These values are defined so that IIR | 0xf would give you the
> + * value for the interrupt. */
> +#define AST_UART_IIR_MSC        (0)
> +#define AST_UART_IIR_THRE       (1 << 1)
> +#define AST_UART_IIR_RDA        (2 << 1)
> +#define AST_UART_IIR_RS         (3 << 1)
> +#define AST_UART_IIR_CTO        (6 << 1)
> +
> +/* RX FIFO Interrupt trigger level */
> +#define AST_UART_FCR_RXFITL_MASK    (3 << 6)
> +/* One byte received */
> +#define AST_UART_FCR_RXFITL1    (0)
> +/* 4 bytes received */
> +#define AST_UART_FCR_RXFITL4    (1 << 6)
> +/* 8 bytes received */
> +#define AST_UART_FCR_RXFITL8    (2 << 6)
> +/* 14 bytes received */
> +#define AST_UART_FCR_RXFITL14   (3 << 6)
> +
> +/* TX FIFO Interrupt trigger level */
> +#define AST_UART_FCR_TXFITL_MASK    (3 << 4)
> +/* FIFO Empty (0 bytes in FIFO) */
> +#define AST_UART_FCR_TXFITL0    (0)
> +/* 2 bytes in FIFO */
> +#define AST_UART_FCR_TXFITL2    (1 << 4)
> +/* FIFO 1/4 full (4 bytes) */
> +#define AST_UART_FCR_TXFITLQ    (2 << 4)
> +/* FIFO 1/2 full (8 bytes) */
> +#define AST_UART_FCR_TXFITLH    (3 << 4)
> +
> +#define AST_UART_FCR_TXFRST     (1 << 2)
> +#define AST_UART_FCR_RXFRST     (1 << 1)
> +#define AST_UART_FCR_FEN        (1 << 0)
> +
> +#define AST_UART_LCR_DLAB       (1 << 7)
> +#define AST_UART_LCR_BC         (1 << 6)
> +#define AST_UART_LCR_EPS        (1 << 4)
> +#define AST_UART_LCR_PEN        (1 << 3)
> +#define AST_UART_LCR_STOP       (1 << 2)
> +
> +/* Number of bits per character */
> +#define AST_UART_LCR_BPC_MASK   (3)
> +#define AST_UART_LCR_BPC5       (0)
> +#define AST_UART_LCR_BPC6       (1)
> +#define AST_UART_LCR_BPC7       (2)
> +#define AST_UART_LCR_BPC8       (3)
> +
> +#define AST_UART_MCR_LB         (1 << 4)
> +#define AST_UART_MCR_OUT2       (1 << 3)
> +#define AST_UART_MCR_OUT1       (1 << 2)
> +#define AST_UART_MCR_RTS        (1 << 1)
> +#define AST_UART_MCR_DTR        (1 << 0)
> +
> +#define AST_UART_LSR_ERXF       (1 << 7)
> +#define AST_UART_LSR_TEMPTY     (1 << 6)
> +#define AST_UART_LSR_THRE       (1 << 5)
> +#define AST_UART_LSR_BI         (1 << 4)
> +#define AST_UART_LSR_FE         (1 << 3)
> +#define AST_UART_LSR_PE         (1 << 2)
> +#define AST_UART_LSR_OE         (1 << 1)
> +#define AST_UART_LSR_DR         (1 << 0)
> +
> +#define AST_UART_MSR_NDCD_OUT2  (1 << 7)
> +#define AST_UART_MSR_NRI_OUT1   (1 << 6)
> +#define AST_UART_MSR_NDSR_NDTR  (1 << 5)
> +#define AST_UART_MSR_NCTS_NRTS  (1 << 4)
> +#define AST_UART_MSR_DDCD       (1 << 3)
> +#define AST_UART_MSR_TERI       (1 << 2)
> +#define AST_UART_MSR_DDSR       (1 << 1)
> +#define AST_UART_MSR_DCTS       (1 << 0)
> +
> +#define AST_UART_FIFO_SIZE      (16)
> +
> +#define ast_uart_wait_txempty(uart) while(!(readl(AST_UART_LSR((uart))) & AST_UART_LSR_TEMPTY))
> +#define ast_uart_write(uart, c)     writel((c), AST_UART_THR((uart)))
> +#define ast_uart_enable_fifo(uart)  setbits_le32(AST_UART_FCR((uart)), AST_UART_FCR_FEN)
> +#define ast_uart_enable_thre_mode(uart) setbits_le32(AST_UART_IER(uart), AST_UART_IER_THRE)

Why not functions for these?

> +
> +/* In THRE and FIFO mode, wait until there is some space in FIFO */
> +#define ast_uart_wait_fifo_ready(uart) while((readl(AST_UART_LSR(uart)) & AST_UART_LSR_THRE))
> +
> +#define ast_uart_set_bpc(uart, bpc) clrsetbits_le32(AST_UART_LCR((uart)), AST_UART_LCR_BPC_MASK, (bpc))
> +
> +#define ast_uart_unlock_dlab(uart) setbits_le32(AST_UART_LCR((uart)), AST_UART_LCR_DLAB)
> +#define ast_uart_lock_dlab(uart) clrbits_le32(AST_UART_LCR(uart), AST_UART_LCR_DLAB)
> +
> +/* NOTE: These write functions only work when THRE mode and FIFOs are enabled. */
> +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t* buffer, uint16_t len);
> +void ast_uart_write_string_sync(uint32_t uart, const char* s);
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b89df82..b714fa9 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -10,8 +10,8 @@
>   *    1. 2012/12/29 Ryan Chen Create
>   *
>  ********************************************************************************/
> -#ifndef __AST_SCU_H
> -#define __AST_SCU_H                     1
> +#ifndef __AST_REGS_SCU_H
> +#define __AST_REGS_SCU_H                     1
>
>  #include <asm/arch/aspeed.h>
>
> diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
> index d72f62a..3e0b4f7 100644
> --- a/arch/arm/mach-aspeed/Makefile
> +++ b/arch/arm/mach-aspeed/Makefile
> @@ -11,5 +11,5 @@
>  #
>
>
> -obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
> +obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o ast_uart.o
>  obj-$(CONFIG_AST_SPI_NOR) += flash.o
> diff --git a/arch/arm/mach-aspeed/ast_uart.c b/arch/arm/mach-aspeed/ast_uart.c
> new file mode 100644
> index 0000000..1226827
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/ast_uart.c
> @@ -0,0 +1,38 @@
> +/*******************************************************************************
> + * Copyright (C) 2016 Google Inc
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + ******************************************************************************/

Fix the header.

> +
> +#include <asm/io.h>
> +#include <asm/arch/ast_uart.h>
> +
> +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t *buffer,
> +                               uint16_t len)
> +{
> +       for (; len; --len, ++buffer) {
> +               ast_uart_wait_fifo_ready(uart);
> +               ast_uart_write(uart, *buffer);
> +       }
> +}
> +
> +void ast_uart_write_string_sync(uint32_t uart, const char *s)
> +{
> +       for (; *s; ++s) {
> +               ast_uart_wait_fifo_ready(uart);
> +               ast_uart_write(uart, *s);
> +       }
> +}

Is there any way we could reuse common string/serial code from u-boot?

> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index 81ea88a..b0b8535 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -35,16 +35,21 @@
>
>  #include <common.h>
>  #include <netdev.h>
> -#include <asm/arch/ast_scu.h>
> +#include <asm/arch/ast_g5_platform.h>
>  #include <asm/arch/ast-sdmc.h>
> +#include <asm/arch/ast_scu.h>
> +#include <asm/arch/ast_uart.h>
> +#include <asm/arch/regs-scu.h>
>  #include <asm/io.h>
>
> +#define AST_DEBUG_UART      (0x1e784000)
> +
>  DECLARE_GLOBAL_DATA_PTR;
>
>  #if defined(CONFIG_SHOW_BOOT_PROGRESS)
>  void show_boot_progress(int progress)
>  {
> -    printf("Boot reached stage %d\n", progress);
> +       printf("Boot reached stage %d\n", progress);

This appears unrelated to your changes.

>  }
>  #endif
>
> @@ -66,9 +71,108 @@ int dram_init(void)
>         return 0;
>  }
>
> +/* assumes digit < 16 */
> +static inline char hex_digit(uint8_t digit)
> +{
> +       if (digit < 10) {
> +               return '0' + digit;
> +       } else {
> +               return 'a' + (digit - 10);
> +       }
> +}
> +
> +static inline void format_u8_hex(char *dst, uint8_t value)
> +{
> +       *dst = hex_digit(value >> 4);
> +       *(dst + 1) = hex_digit(value & 0xf);
> +}

These are common printf formatting. Can we use them from another part of u-boot?

> +
> +static inline void debug_uart_print(const char *s)
> +{
> +       ast_uart_write_string_sync(AST_DEBUG_UART, s);
> +}
> +
> +void debug_print_ddr_version(uint8_t version)
> +{
> +       char message[8] = "-DDR_\r\n";
> +       message[4] = '0' + version;
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_dram_init_message(uint8_t version)
> +{
> +       char message[16] = "\r\nDRAM Init-V__";
> +       char *version_dst = message + 13;
> +       format_u8_hex(version_dst, version);
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_dram_size(char size)
> +{
> +       char message[6] = "-_Gb-";
> +       message[1] = size;
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_ddr_status(bool done)
> +{
> +       if (done) {
> +               debug_uart_print("Done\r\n");
> +       } else {
> +               debug_uart_print("Fail\r\n");
> +       }
> +}
> +
> +static inline void format_phy_timing(char *dst, uint8_t value)
> +{
> +       /* This is adopted from platforms.S file by Aspeed.
> +        * They read memory address (which is not mentioned in the data sheet)
> +        * and then divide byte value by 510 and print 4 digits after the dot.
> +        */
> +       uint32_t timing_value = value * 1000 / 51;
> +       for (int index = 3; index >= 0 && timing_value > 0; --index) {
> +               uint8_t digit = timing_value % 10;
> +               timing_value /= 10;
> +               dst[index] = '0' + digit;
> +       }
> +}
> +
> +void debug_print_ddr_phy_timing(uint16_t margin)
> +{
> +       char message[46] = "Read margin DL:0.0000/0.0000 CK (min: 0.35)\r\n";
> +       format_phy_timing(message + 17, margin & 0xff);
> +       format_phy_timing(message + 24, (margin >> 8) & 0xff);
> +       debug_uart_print(message);
> +}
> +
> +static void init_uart_for_debug(uint32_t uart_base)
> +{
> +       ast_uart_set_bpc(uart_base, AST_UART_LCR_BPC8);
> +       ast_uart_unlock_dlab(uart_base);
> +       const uint32_t uart_clk_mul =
> +           readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL) & (1 << 12) ? 1 : 13;
> +#ifdef CONFIG_DRAM_UART_38400
> +       const uint32_t br_base = 3 * uart_clk_mul;
> +#else
> +       const uint32_t br_base = 1 * uart_clk_mul;
> +#endif
> +       writel(br_base, AST_UART_DLL(uart_base));
> +       writel(0, AST_UART_DLH(uart_base));
> +
> +       /* Lock DLAB */
> +       ast_uart_lock_dlab(uart_base);
> +       ast_uart_enable_fifo(uart_base);
> +       ast_uart_enable_thre_mode(uart_base);
> +}
> +
> +void init_debug_uart(void)
> +{
> +       init_uart_for_debug(AST_DEBUG_UART);
> +}
> +
>  #ifdef CONFIG_CMD_NET
>  int board_eth_init(bd_t *bd)
>  {
> -        return ftgmac100_initialize(bd);
> +       return ftgmac100_initialize(bd);

Unrelated change.

>  }
>  #endif
> diff --git a/board/aspeed/ast-g5/platform.S b/board/aspeed/ast-g5/platform.S
> index c810f44..a33afee 100644
> --- a/board/aspeed/ast-g5/platform.S
> +++ b/board/aspeed/ast-g5/platform.S
> @@ -78,7 +78,6 @@
>  #include <version.h>
>
>  /******************************************************************************
> -  r4 : return program counter

??

>    r5 : DDR speed timing table base address
>    Free registers:
>    r0, r1, r2, r3, r6, r7, r8, r9, r10, r11
> @@ -104,6 +103,9 @@
>  #define ASTMMC_REGIDX_RFC    0x3C
>  #define ASTMMC_REGIDX_PLL    0x40
>
> +#define AST_SRAM_END  0x1e728ffc
> +
> +
>  TIME_TABLE_DDR3_1333:
>      .word   0x53503C37       @ 0x010
>      .word   0xF858D47F       @ 0x014
> @@ -242,12 +244,20 @@ TIME_TABLE_DDR4_1600:
>   Calibration Macro End
>   ******************************************************************************/
>
> +.globl debug_print_dram_init_message
> +.globl debug_print_ddr_version
> +.globl debug_print_dram_size
> +.globl debug_print_ddr_status
> +.globl debug_print_ddr_phy_timing
> +.globl init_debug_uart
>  .globl lowlevel_init
>  lowlevel_init:
>
>  init_dram:
> +    /* Setup a stack in SRAM */
> +    ldr   sp, =AST_SRAM_END
>      /* save lr */
> -    mov   r4, lr
> +    push  {lr}
>
>      /* Clear AHB bus lock condition */
>      ldr   r0, =0x1e600000
> @@ -489,82 +499,10 @@ wait_mmc_reset_done:
>      ldr   r1, =0x00020000
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e78400c
> -    mov   r1, #0x83
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e6e202c
> -    ldr   r2, [r0]
> -    mov   r2, r2, lsr #12
> -    tst   r2, #0x01
> -    ldr   r0, =0x1e784000
> -    moveq r1, #0x0D                              @ Baudrate 115200
> -    movne r1, #0x01                              @ Baudrate 115200, div13
> -#ifdef CONFIG_DRAM_UART_38400
> -    moveq r1, #0x27                              @ Baudrate 38400
> -    movne r1, #0x03                              @ Baudrate 38400 , div13
> -#endif
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784004
> -    mov   r1, #0x00
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e78400c
> -    mov   r1, #0x03
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784008
> -    mov   r1, #0x07
> -    str   r1, [r0]
> +    bl    init_debug_uart
>
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> -    mov   r1, #0x41                              @ 'A'
> -    str   r1, [r0]
> -    mov   r1, #0x4D                              @ 'M'
> -    str   r1, [r0]
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x49                              @ 'I'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x74                              @ 't'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    mov   r1, #0x56                              @ 'V'
> -    str   r1, [r0]
> -    mov   r1, #ASTMMC_INIT_VER
> -    mov   r1, r1, lsr #4
> -    print_hex_char
> -    mov   r1, #ASTMMC_INIT_VER
> -    print_hex_char
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    ldr   r0, =0x1e784014
> -wait_print:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> +    mov   r0, #ASTMMC_INIT_VER
> +    bl    debug_print_dram_init_message
>  /* Debug - UART console message */
>
>  /******************************************************************************
> @@ -647,15 +585,8 @@ wait_print:
>   DDR3 Init
>   ******************************************************************************/
>  ddr3_init:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x33                              @ '3'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #3
> +    bl    debug_print_ddr_version
>
>  #if   defined (CONFIG_DRAM_1333)
>      adrl  r5, TIME_TABLE_DDR3_1333               @ Init DRAM parameter table
> @@ -865,15 +796,8 @@ ddr3_check_dllrdy:
>   DDR4 Init
>   ******************************************************************************/
>  ddr4_init:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x34                              @ '4'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #4
> +    bl    debug_print_ddr_version
>
>  #if   defined (CONFIG_DRAM_1333)
>      adrl  r5, TIME_TABLE_DDR4_1333               @ Init DRAM parameter table
> @@ -1439,18 +1363,8 @@ check_dram_size_end:
>      ldr   r1, =ASTMMC_INIT_DATE
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    str   r3, [r0]
> -    mov   r1, #0x47                              @ 'G'
> -    str   r1, [r0]
> -    mov   r1, #0x62                              @ 'b'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, r3
> +    bl    debug_print_dram_size
>
>      /* Enable DRAM Cache */
>      ldr   r0, =0x1e6e0004
> @@ -1520,26 +1434,8 @@ ddr_wait_engine_idle_1:
>      b     set_scratch                            @ CBRTest() return(1)
>
>  ddr_test_fail:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x46                              @ 'F'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6C                              @ 'l'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -    ldr   r0, =0x1e784014
> -wait_print_0:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_0
> -/* Debug - UART console message */
> +    mov   r0, #0
> +    bl    debug_print_ddr_status
>      b     reset_mmc
>
>  set_scratch:
> @@ -1549,21 +1445,8 @@ set_scratch:
>      orr   r1, r1, #0x41
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x6F                              @ 'o'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x65                              @ 'e'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #1
> +    bl    debug_print_ddr_status
>
>      /* Enable VGA display */
>      ldr   r0, =0x1e6e202c
> @@ -1571,184 +1454,10 @@ set_scratch:
>      bic   r1, r1, #0x40
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -   /* Print PHY timing information */
> -    ldr   r0, =0x1e784014
> -wait_print_1:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_1
> -
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> -    mov   r1, #0x65                              @ 'e'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x64                              @ 'd'
> -    str   r1, [r0]
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x6D                              @ 'm'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x72                              @ 'r'
> -    str   r1, [r0]
> -    mov   r1, #0x67                              @ 'g'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x4C                              @ 'L'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_2:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_2
> -
> -    ldr   r7, =0x000001FE                        @ divide by 510
> -    mov   r8, #10                                @ multiply by 10
> -print_DQL_eye_margin:
> -    ldr   r0, =0x1e6e03d0
> -    ldr   r2, [r0]
> -    and   r2, r2, #0xFF
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r3, #0x4                               @ print 4 digits
> -print_DQL_div_loop:
> -    mul   r2, r8, r2
> -    cmp   r2, r7
> -    blt   print_DQL_div_0
> -    mov   r6, #0x0
> -print_DQL_div_digit:
> -    sub   r2, r2, r7
> -    add   r6, r6, #0x1
> -    cmp   r2, r7
> -    bge   print_DQL_div_digit
> -    b     print_DQL_div_n
> -
> -print_DQL_div_0:
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    b     print_DQL_next
> -print_DQL_div_n:
> -    add   r1, r6, #0x30                          @ print n
> -    str   r1, [r0]
> -print_DQL_next:
> -    subs  r3, r3, #1
> -    beq   print_DQH_eye_margin
> -    cmp   r2, #0x0
> -    beq   print_DQH_eye_margin
> -    b     print_DQL_div_loop
> -
> -print_DQH_eye_margin:
> -    mov   r1, #0x2F                              @ '/'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x48                              @ 'H'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_3:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_3
> -
>      ldr   r0, =0x1e6e03d0
>      ldr   r2, [r0]
> -    mov   r2, r2, lsr #8
> -    and   r2, r2, #0xFF
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r3, #0x4                               @ print 4 digits
> -print_DQH_div_loop:
> -    mul   r2, r8, r2
> -    cmp   r2, r7
> -    blt   print_DQH_div_0
> -    mov   r6, #0x0
> -print_DQH_div_digit:
> -    sub   r2, r2, r7
> -    add   r6, r6, #0x1
> -    cmp   r2, r7
> -    bge   print_DQH_div_digit
> -    b     print_DQH_div_n
> -
> -print_DQH_div_0:
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    b     print_DQH_next
> -print_DQH_div_n:
> -    add   r1, r6, #0x30                          @ print n
> -    str   r1, [r0]
> -print_DQH_next:
> -    subs  r3, r3, #1
> -    beq   print_DQ_eye_margin_last
> -    cmp   r2, #0x0
> -    beq   print_DQ_eye_margin_last
> -    b     print_DQH_div_loop
> -
> -print_DQ_eye_margin_last:
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x43                              @ 'C'
> -    str   r1, [r0]
> -    mov   r1, #0x4B                              @ 'K'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_4:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_4
> -
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x28                              @ '('
> -    str   r1, [r0]
> -    mov   r1, #0x6D                              @ 'm'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r1, #0x33                              @ '3'
> -    str   r1, [r0]
> -    mov   r1, #0x35                              @ '5'
> -    str   r1, [r0]
> -    mov   r1, #0x29                              @ ')'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, r2
> +    bl    debug_print_ddr_phy_timing
>
>  platform_exit:
>  #ifdef CONFIG_DRAM_ECC
> @@ -1991,9 +1700,5 @@ set_D2PLL:
>      ldr   r1, =0xEA
>      str   r1, [r0]
>
> -    /* restore lr */
> -    mov   lr, r4
> -
>      /* back to arch calling code */
> -    mov   pc, lr
> -
> +    pop   {pc}
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
