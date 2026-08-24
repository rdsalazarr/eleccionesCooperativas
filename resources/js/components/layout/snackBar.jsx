import { forwardRef } from 'react';
import { SnackbarProvider, enqueueSnackbar, useSnackbar, SnackbarContent } from 'notistack';
import {CheckCircle, ReportProblem, Error as ErrorIcon,  Info as InfoIcon, Close as CloseIcon } from '@mui/icons-material';
import { IconButton, Box } from '@mui/material';

const variantIcon = {
    success: CheckCircle,
    warning: ReportProblem,
    error:   ErrorIcon,
    info:    InfoIcon,
};

const CustomSnackbar = forwardRef(({ id, message, variant, ...props }, ref) => {
    const { closeSnackbar } = useSnackbar();
    const Icon = variantIcon[variant] || InfoIcon;

    // Limpiamos las props para evitar los errores de consola
    const { persist, snackbars, anchorOrigin, autoHideDuration, iconVariant, hideIconVariant, ...domProps } = props;
  
    const variantConfig = {
        success: {
            color: '#22c55e',
            alpha: 'rgba(34,197,94,0.12)',
            glow:  'rgba(34,197,94,0.35)',
            label: 'Éxito',
        },
        error: {
            color: '#ef4444',
            alpha: 'rgba(239,68,68,0.12)',
            glow:  'rgba(239,68,68,0.35)',
            label: 'Error',
        },
        warning: {
            color: '#f59e0b',
            alpha: 'rgba(245,158,11,0.12)',
            glow:  'rgba(245,158,11,0.3)',
            label: 'Advertencia',
        },
        info: {
            color: '#3b82f6',
            alpha: 'rgba(59,130,246,0.12)',
            glow: 'rgba(59,130,246,0.3)',
            label: 'Info',
        },
    };

    const cfg = variantConfig[variant] || variantConfig.info;

    return (
        <SnackbarContent ref={ref} {...domProps}>
            <Box sx={{
                position: 'relative',
                display: 'flex',
                alignItems: 'center',
                minWidth: '320px',
                maxWidth: '420px',
                borderRadius: '16px',
                overflow: 'hidden',
                background: '#e1e1e1',
                border: '1px solid rgba(255,255,255,0.08)',
                boxShadow: '0 20px 60px rgba(0,0,0,0.5), 0 1px 0 rgba(255,255,255,0.06) inset',
                transition: 'transform 0.2s ease, box-shadow 0.2s ease',
                zIndex: '9999',
                marginTop: '2em',
                '&:hover': {
                    transform: 'translateY(-2px)',
                    boxShadow: '0 28px 70px rgba(0,0,0,0.6), 0 1px 0 rgba(255,255,255,0.08) inset',
                }
            }}>

                <Box sx={{
                    width: '4px',
                    alignSelf: 'stretch',
                    flexShrink: 0,
                    bgcolor: cfg.color,
                }} />

                <Box sx={{
                    width: 40,
                    height: 40,
                    borderRadius: '12px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    flexShrink: 0,
                    mx: '14px',
                    bgcolor: cfg.alpha,
                    position: 'relative',
                    '&::after': {
                        content: '""',
                        position: 'absolute',
                        inset: 0,
                        borderRadius: '12px',
                        boxShadow: `0 0 12px ${cfg.glow}`,
                        opacity: 0.5,
                    }
                }}>
                    <Icon sx={{ color: cfg.color, fontSize: 30 }} />
                </Box>

                <Box sx={{ flex: 1, py: 1.75 }}>
                    <Box sx={{
                        fontSize: '0.8125rem',
                        fontWeight: 700,
                        color: cfg.color,
                        letterSpacing: '0.2px',
                        lineHeight: 1,
                        mb: '2px',
                        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif',
                    }}>
                        {cfg.label}
                    </Box>
                    <Box sx={{
                        fontSize: '0.8rem',
                        fontWeight: 600,
                        color: '#2a2929',
                        letterSpacing: '0.1px',
                        lineHeight: 1.4,
                        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif',
                    }}>
                        {message}
                    </Box>
                </Box>

                <IconButton
                    size="small"
                    onClick={() => closeSnackbar(id)}
                    sx={{
                        width: 28,
                        height: 28,
                        borderRadius: '8px',
                        mr: 1.5,
                        flexShrink: 0,
                        bgcolor: 'rgba(255,255,255,0.05)',
                        color: '#2a2929',
                        '&:hover': {
                            bgcolor: '#ef4444',
                            color: 'rgba(255,255,255)',
                            transform: 'scale(1.05)',
                        },
                        transition: 'all 0.15s ease',
                    }}
                >
                    <CloseIcon sx={{ fontSize: '14px' }} />
                </IconButton>

                <Box sx={{
                    position: 'absolute',
                    bottom: 0,
                    left: 0,
                    height: '2px',
                    width: '100%',
                    bgcolor: cfg.color,
                    opacity: 0.5,
                    borderRadius: '0 2px 0 0',
                    transformOrigin: 'left',
                    animation: `shrink ${autoHideDuration || 4000}ms linear forwards`,
                    '@keyframes shrink': {
                        from: { transform: 'scaleX(1)' },
                        to: { transform: 'scaleX(0)' },
                    }
                }} />
            </Box>
        </SnackbarContent>
    );
});

export const SnackbarSettings = ({ children }) => (
    <SnackbarProvider
        maxSnack={3}
        autoHideDuration={4000}
        anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
        Components={{
            success: CustomSnackbar,
            error: CustomSnackbar,
            warning: CustomSnackbar,
            info: CustomSnackbar,
        }}
    >
        {children}
    </SnackbarProvider>
);

export const ShowSnackbar = (msg, variant = 'info') => {
    enqueueSnackbar(msg, { variant }); //, persist: true
};