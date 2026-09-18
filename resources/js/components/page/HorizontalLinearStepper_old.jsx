import {useEffect, useState, useCallback, useRef, Fragment } from 'react';
import Box from '@mui/material/Box';
import Stepper from '@mui/material/Stepper';
import Step from '@mui/material/Step';
import StepLabel from '@mui/material/StepLabel';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';

const steps = [
    'Verificación',
    'Selección',
    'Confirmación'
];


export default function HorizontalLinearStepper() {

    const [activeStep, setActiveStep] = useState(0);
    const [skipped, setSkipped] = useState(new Set());

    const isStepOptional = useCallback((step) => {
        return step === 1;
    }, []);

    const isStepSkipped = (step) => {
        return skipped.has(step);
    };

    const handleNext = () => {

        let newSkipped = skipped;

        if (isStepSkipped(activeStep)) {

            newSkipped = new Set(newSkipped.values());
            newSkipped.delete(activeStep);

        }

        setActiveStep((prevActiveStep) => prevActiveStep + 1);
        setSkipped(newSkipped);
    };

    const handleBack = () => {
        setActiveStep((prevActiveStep) => prevActiveStep - 1);
    };

    const handleSkip = () => {

        if (!isStepOptional(activeStep)) {

            throw new Error(
                "You can't skip a step that isn't optional."
            );

        }

        setActiveStep((prevActiveStep) => prevActiveStep + 1);

        setSkipped((prevSkipped) => {

            const newSkipped = new Set(prevSkipped.values());

            newSkipped.add(activeStep);

            return newSkipped;
        });
    };

    const handleReset = () => {
        setActiveStep(0);
    };

    const previousActiveStepRef = useRef(activeStep);

    const resetButtonRef = useRef(null);
    const nextButtonRef = useRef(null);

    // Control del foco cuando cambia el paso activo
    useEffect(() => {

        const previousActiveStep = previousActiveStepRef.current;

        previousActiveStepRef.current = activeStep;

        // Cuando termina todos los pasos,
        // coloca el foco en el botón Reset.
        if (activeStep === steps.length) {

            resetButtonRef.current?.focus();

            return;
        }

        // Cuando hace Reset después de terminar,
        // coloca el foco en Next.
        if (
            activeStep === 0 &&
            previousActiveStep === steps.length
        ) {

            nextButtonRef.current?.focus();

            return;
        }

        // Si se saltó un paso opcional,
        // coloca el foco en Next.
        if (
            isStepOptional(previousActiveStep) &&
            !isStepOptional(activeStep)
        ) {

            nextButtonRef.current?.focus();
        }

    }, [activeStep, isStepOptional]);

    return (
      <>
        <Box sx={{ width: '100%' }}>

            <Stepper activeStep={activeStep} >

                {steps.map((label, index) => {

                    const stepProps = {};
                    const labelProps = {};

                    if (isStepSkipped(index)) {

                        stepProps.completed = false;
                    }

                    return (
                        <Step
                            key={label}
                            {...stepProps}
                        >

                            <StepLabel {...labelProps}>
                                {label}
                            </StepLabel>

                        </Step>
                    );
                })}

            </Stepper>

            {activeStep === steps.length ? (

                // --------------------------------
                // TODOS LOS PASOS COMPLETADOS
                // --------------------------------

                <Fragment>

                    <Typography sx={{ mt: 2, mb: 1 }}>
                        All steps completed - you're finished
                    </Typography>

                    <Box
                        sx={{
                            display: 'flex',
                            flexDirection: 'row',
                            pt: 2
                        }}
                    >

                        <Box sx={{ flex: '1 1 auto' }} />

                        <Button
                            onClick={handleReset}
                            ref={resetButtonRef}
                        >
                            Reset
                        </Button>

                    </Box>

                </Fragment>

            ) : (

                // --------------------------------
                // PASO ACTUAL
                // --------------------------------

                <Box  className='card'>

                    <Typography sx={{ mt: 2, mb: 1 }}>
                        Step {activeStep + 1}
                    </Typography>

                    <Box
                        sx={{
                            display: 'flex',
                            flexDirection: 'row',
                            pt: 2
                        }}
                    >

                        <Button
                            color="inherit"
                            disabled={activeStep === 0}
                            onClick={handleBack}
                            sx={{ mr: 1 }}
                        >
                            Back
                        </Button>

                        <Box sx={{ flex: '1 1 auto' }} />

                        {isStepOptional(activeStep) && (

                            <Button
                                color="inherit"
                                onClick={handleSkip}
                                sx={{ mr: 1 }}
                            >
                                Skip
                            </Button>

                        )}

                        <Button
                            onClick={handleNext}
                            ref={nextButtonRef}
                        >
                            {activeStep === steps.length - 1
                                ? 'Finish'
                                : 'Next'
                            }
                        </Button>

                    </Box>

                </Box>

            )}

        </Box>
        

      

        <Stepper
            activeStep={activeStep}
            className="progress"
        >
            {steps.map((label, index) => {

                const stepProps = {};
                const labelProps = {};
            
                if (isStepSkipped(index)) {
                    stepProps.completed = false;
                }

                return (
                    <Step
                        key={label}
                        {...stepProps}
                        className={`step ${
                            activeStep === index
                                ? 'active'
                                : activeStep > index
                                    ? 'done'
                                    : ''
                        }`}
                    >

                        <StepLabel {...labelProps}>
                            {label}
                        </StepLabel>

                    </Step>
                );
            })}
        </Stepper>        
        </>
    );
}